# this is the main function of model selection.

import calendar
import json
import os
import time

from exps.main_sigmod.common.shared_args import parse_arguments


def generate_data_loader():
    if args.dataset in [Config.c10, Config.c100, Config.imgNet]:
        train_loader, val_loader, class_num = dataset.get_dataloader(
            train_batch_size=args.batch_size,
            test_batch_size=args.batch_size,
            dataset=args.dataset,
            num_workers=1,
            datadir=os.path.join(args.base_dir, "data"))
        test_loader = val_loader
    else:
        train_loader, val_loader, test_loader = libsvm_dataloader(
            args=args,
            data_dir=os.path.join(args.base_dir, "data", "structure_data", args.dataset),
            nfield=args.nfield,
            batch_size=args.batch_size)
        class_num = args.num_labels

    return train_loader, val_loader, test_loader, class_num


def run_with_time_budget(time_budget: float):
    """
    :param time_budget: the given time budget, in second
    :return:
    """

    # define dataLoader, and sample a mini-batch
    train_loader, val_loader, test_loader, class_num = generate_data_loader()
    args.num_labels = class_num
    data_loader = [train_loader, val_loader, test_loader]

    rms = RunModelSelection(args.search_space, args.dataset, args, is_simulate=True)
    best_arch, best_arch_performance, _, _, _ = rms.select_model_online(
        budget=time_budget,
        data_loader=data_loader,
        only_phase1=False,
        run_workers=1)

    return best_arch, best_arch_performance


if __name__ == "__main__":
    args = parse_arguments()

    # set the log name
    gmt = time.gmtime()
    ts = calendar.timegm(gmt)
    os.environ.setdefault("log_file_name", args.log_name + "_" + str(ts) + ".log")
    os.environ.setdefault("base_dir", args.base_dir)

    from eva_engine.run_ms import RunModelSelection
    from storage import dataset
    from common.constant import Config
    from logger import logger
    from storage.structure_data_loader import libsvm_dataloader
    from common.structure import ModelEvaData, ModelAcquireData
    from controller import RegularizedEASampler
    from controller.controler import SampleController
    from eva_engine.phase2.evaluator import P2Evaluator
    from search_space.init_search_space import init_search_space
    from utilslibs.io_tools import write_json

    result = {
        "baseline_time_budget": [],
        "baseline_acc": []
    }

    total_explore = 2500
    total_run = 100
    train_epoch = 19

    checkpoint_file = f"./exps/main_sigmod/analysis/res_train_base_line_{args.dataset}_epoch_{train_epoch}.json"

    for run_id in range(total_run):

        search_space_ins = init_search_space(args)
        # seq: init the search strategy and controller,
        strategy = RegularizedEASampler(search_space_ins,
                                        population_size=args.population_size,
                                        sample_size=args.sample_size)

        sampler = SampleController(strategy)

        _evaluator = P2Evaluator(search_space_ins, args.dataset,
                                 is_simulate=True,
                                 train_loader=None,
                                 val_loader=None,
                                 args=args)

        all_time_usage = 0
        explored_n = 0
        model_eva = ModelEvaData()
        # xarray
        time_usage_array = []
        # y_array
        auc_array = []
        performance_his = []
        while explored_n < total_explore:
            # generate new model
            arch_id, arch_micro = sampler.sample_next_arch()
            model_encoding = search_space_ins.serialize_model_encoding(arch_micro)

            explored_n += 1

            # run the model selection
            model_acquire_data = ModelAcquireData(model_id=str(arch_id),
                                                  model_encoding=model_encoding,
                                                  is_last=False)
            data_str = model_acquire_data.serialize_model()

            # update the shared model eval res
            model_eva.model_id = str(arch_id)
            auc, time_usage = _evaluator.p2_evaluate(str(arch_id), train_epoch)
            model_eva.model_score = {"AUC": auc}
            sampler.fit_sampler(model_eva.model_id, model_eva.model_score, use_prue_score=False)

            if train_epoch == args.epoch:
                full_train_auc = auc
            else:
                full_train_auc, _ = _evaluator.p2_evaluate(str(arch_id), args.epoch)
            performance_his.append(full_train_auc)
            logger.info("3. [FIRMEST] Phase 1: filter phase explored " + str(explored_n) +
                        " model, model_id = " + model_eva.model_id +
                        " model_scores = " + json.dumps(model_eva.model_score))

            all_time_usage += time_usage
            time_usage_array.append(all_time_usage/60)
            auc_array.append(max(performance_his))

        result["baseline_time_budget"].append(time_usage_array)
        result["baseline_acc"].append(auc_array)

    write_json(checkpoint_file, result)
