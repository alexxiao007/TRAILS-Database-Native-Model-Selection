

import random
import matplotlib.pyplot as plt
from eva_engine.phase2.run_phase2 import P2Evaluator
from query_api.db_base import fetch_from_db
from utilslibs.parse_pre_res import SimulateTrain
from common.constant import Config
from eva_engine.phase2.algo.sh import BudgetAwareControllerSH
import os
import numpy as np
import query_api.query_model_gt_acc_api as gt_api


def B2_to_time(epochs):
    # in second
    p2_each_epoch_run_time = 20
    return epochs * p2_each_epoch_run_time


def time_to_B1(left_time):
    """
    Return how many time used, and how many models to be score
    :param left_time:
    :return:
    """
    # in second
    p1_score_time = random.randint(3315, 4502) * 0.0001
    B1_m = int(left_time/p1_score_time)
    if B1_m > 15624:
        B1_m = 15624
        real_time_usage = 15624 * p1_score_time
    else:
        real_time_usage = left_time
    return real_time_usage, B1_m


if __name__ == "__main__":
    base_dir = os.getcwd()

    used_space = Config.NB201
    used_dataset = Config.c10

    time_per_epoch = gt_api.guess_train_one_epoch_time(used_space, used_dataset)

    fgt = SimulateTrain(used_space, 200)
    evaluator = P2Evaluator(used_space, used_dataset)
    eta = 3
    sh = BudgetAwareControllerSH(evaluator, eta, time_per_epoch)

    # y_k_array = [1, 5, 10, 20, 50, 100, 200]
    y_k_array = range(1, 200, 1)
    x_epoch_array = [1]
    # budget_array = [0.1, 0.2, 0.3, 0.4, 0.5, 8, 16, 24, 32, 64, 128, 256]
    # mins
    budget_array = [1, 5, 10, 15, 20, 30, 50, 100, 500, 1000]
    # budget_array = [300]
    # budget_array = [180]
    # budget_array = np.logspace(1, 2.5, endpoint=True).tolist()

    # this is for log-scale logs
    k_div_n = []
    per_on_budget = []

    # this is in hour
    for time_min in budget_array:
        T = time_min * 60

        two_D_run_acc = []
        two_D_run_BT = []
        two_D_run_b1 = []
        two_D_run_b2 = []

        B1_all = []
        B2_all = []

        # this is for budget
        k_div_n_bt = []
        per_bt = []

        for k in y_k_array:
            each_run_k_acc = []
            each_run_k_bt = []
            each_b1_run = []
            each_b2_run = []
            for run_id in range(100):
                eac_k_acc = []
                eac_k_bt = []  # in hour
                each_b1 = []
                each_b2 = []
                for U in x_epoch_array:
                    B2_planed = sh.pre_calculate_epoch_required(k, U)
                    p2_time = B2_to_time(B2_planed)

                    if T - p2_time < 1:
                        eac_k_acc.append(-1)
                        eac_k_bt.append(-1)
                        each_b1.append(-1)
                        each_b2.append(-1)
                    else:
                        p1_time, B1 = time_to_B1(T - p2_time)  # how many to score in p1
                        if B1 < k:
                            eac_k_acc.append(-1)
                            eac_k_bt.append(-1)
                            each_b1.append(-1)
                            each_b2.append(-1)
                        else:
                            arch_id, candidates_all, curr_time = fetch_from_db(used_space, used_dataset, run_id, B1)
                            best_arch, B2_used = run(U, candidates_all[-k:])
                            assert B2_used == B2_planed, f"when time_min = {time_min}, U={U}, k = {k}" \
                                                         f" differs in {B2_used-B2_planed}"
                            acc_sh_v, _ = fgt.get_ground_truth(best_arch, dataset=used_dataset)
                            # record for drawing
                            eac_k_acc.append(int(acc_sh_v * 10000) / 10000)
                            eac_k_bt.append((p1_time + p2_time) / 60)
                            each_b1.append(B1)
                            each_b2.append(B2_used)
                each_run_k_acc.append(eac_k_acc)
                each_run_k_bt.append(eac_k_bt)
                each_b1_run.append(each_b1)
                each_b2_run.append(each_b2)

            mean_acc = np.quantile(np.array(each_run_k_acc), .5, axis=0)
            mean_bt = np.quantile(np.array(each_run_k_bt), .5, axis=0)

            mean_b1 = np.quantile(np.array(each_b1_run), .5, axis=0)
            mean_b2 = np.quantile(np.array(each_b2_run), .5, axis=0)

            two_D_run_acc.append(mean_acc.tolist())
            two_D_run_BT.append(mean_bt.tolist())

            two_D_run_b1.append(mean_b1.tolist())
            two_D_run_b2.append(mean_b2.tolist())
            if mean_acc.tolist()[0] != -1:
                k_div_n_bt.append(mean_b1.tolist()[0]/k)

        # draw_grid_graph_with_budget(
        #     two_D_run_acc, two_D_run_BT, two_D_run_b1, two_D_run_b2, f"{Th}b1b2",
        #     y_k_array, x_epoch_array
        # )

        print(f"T={T}, eta={eta}, Acc_list = ", two_D_run_acc)
        print(f"T={T}, eta={eta}, Budget_list = ", two_D_run_BT)
        print(f"T={T}, eta={eta}, two_D_run_b1 = ", two_D_run_b1)
        print(f"T={T}, eta={eta}, two_D_run_b2 = ", two_D_run_b2)
        print("\n")

        for i in range(len(two_D_run_acc)):
            acc = two_D_run_acc[i][0]
            if acc != -1:
                per_bt.append(acc)
        k_div_n.append(k_div_n_bt)
        per_on_budget.append(per_bt)

    print("k_div_n = ", k_div_n)
    print("per_on_budget = ", per_on_budget)

    N_K_ratio = 0
    # this is to plot trade off between N and K
    for i in range(len(k_div_n)):
        x = k_div_n[i]
        y = per_on_budget[i]
        plt.plot(x, y, "-*", label="budget=" + str(budget_array[i]) + " min")

        N_K_ratio += x[y.index(max(y))]
    N_K_ratio = N_K_ratio/len(k_div_n)
    print("N/K ratio = ", N_K_ratio)
    plt.xscale("symlog")
    plt.grid()
    plt.xlabel("N/K")
    plt.ylabel("Test Accuracy")
    plt.legend()
    # plt.show()
    plt.savefig(f"trade_off_nk_{used_dataset}.pdf", bbox_inches='tight')

