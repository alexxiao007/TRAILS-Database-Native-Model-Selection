
import os
import random
import threading
import time
from common.constant import Config
from utilslibs.io_tools import read_json, read_pickle


base_dir = os.environ.get("base_dir")
if base_dir is None:base_dir = os.getcwd()
print("gt_api running at {}".format(base_dir))
gt201 = os.path.join(base_dir, "result_base/ground_truth/201_allEpoch_info")

gt101 = os.path.join(base_dir, "result_base/ground_truth/101_allEpoch_info_json")
gt101P = os.path.join(base_dir, "result_base/ground_truth/nasbench1_accuracy.p")
id_to_hash_path = os.path.join(base_dir, "result_base/ground_truth/nb101_id_to_hash.json")


def guess_score_time(search_space_m, dataset):
    if search_space_m == Config.NB101:
        return Gt101.guess_score_time()
    if search_space_m == Config.NB201:
        return Gt201.guess_score_time(dataset)


def guess_train_one_epoch_time(search_space_m, dataset):
    if search_space_m == Config.NB101:
        return Gt101().guess_train_one_epoch_time()
    if search_space_m == Config.NB201:
        return Gt201().guess_train_one_epoch_time(dataset)


def profile_NK_trade_off(dataset):
    if dataset == Config.c10:
        return 85
    if dataset == Config.c100:
        return 85
    if dataset == Config.imgNet:
        return 130


class Singleton(object):
    _instance_lock = threading.Lock()

    def __new__(cls, *args, **kwargs):
        if not hasattr(Singleton, "_instance"):
            with Singleton._instance_lock:
                if not hasattr(Singleton, "_instance"):
                    Singleton._instance = object.__new__(cls)
        return Singleton._instance


class Gt201(Singleton):
    # multiple instance share the class variables.
    _instance_lock = threading.Lock()
    data201 = None

    def load_201(self):
        if self.data201 is None:
            self.data201 = read_json(gt201)

    def get_c10valid_200epoch_test_info(self, arch_id: int):
        """
        cifar10-valid means train with train set, valid with validation dataset
        Thus, acc is lower than train with train+valid.
        :param arch_id:
        :return:
        """
        return self.query_200_epoch(str(arch_id), Config.c10_valid)

    def get_c10_200epoch_test_info(self, arch_id: int):
        """
        cifar10-valid means train with train set, valid with validation dataset
        Thus, acc is lower than train with train+valid.
        :param arch_id:
        :return:
        """
        return self.query_200_epoch(str(arch_id), Config.c10)

    def get_c100_200epoch_test_info(self, arch_id: int):
        return self.query_200_epoch(str(arch_id), Config.c100)

    def get_imgNet_200epoch_test_info(self, arch_id: int):
        return self.query_200_epoch(str(arch_id), Config.imgNet)

    def query_200_epoch(self, arch_id: str, dataset, epoch_num: int = 199):
        self.load_201()
        if epoch_num is None or epoch_num > 199:
            epoch_num = 199
        arch_id = str(arch_id)
        t_acc = self.data201[arch_id]["200"][dataset][str(epoch_num)]["test_accuracy"]
        time_usage = self.data201[arch_id]["200"][dataset][str(epoch_num)]["time_usage"]
        return t_acc, time_usage

    def query_12_epoch(self, arch_id: str, dataset, epoch_num: int = 11):
        self.load_201()
        if epoch_num is None or epoch_num > 11:
            epoch_num = 11
        arch_id = str(arch_id)
        t_acc = self.data201[arch_id]["12"][dataset][str(epoch_num)]["test_accuracy"]
        time_usage = self.data201[arch_id]["12"][dataset][str(epoch_num)]["time_usage"]
        return t_acc, time_usage

    def count_models(self):
        return len(self.data201)

    @classmethod
    def guess_score_time(cls, dataset=Config.c10):
        return random.randint(3315, 4502) * 0.0001

    def guess_train_one_epoch_time(self, dataset):
        if dataset == Config.c10:
            dataset = Config.c10_valid
        # pick the max value over 5k arch training time, it's 40
        # res = 0
        # for arch_id in range(15624):
        #     _, time_usage = self.query_200_epoch(str(arch_id), dataset, 1)
        #     if time_usage > res:
        #         res = time_usage
        # return res
        return 40


class Gt101(Singleton):
    # multiple instance share the class variables.
    data101_from_zerocost = None
    id_to_hash_map = None
    data101_full = None

    def load_101(self):
        if self.data101_from_zerocost is None:
            self.data101_from_zerocost = read_pickle(gt101P)
            self.id_to_hash_map = read_json(id_to_hash_path)
            self.data101_full = read_json(gt101)

    def get_c10_test_info(self, arch_id: str, dataset: str = Config.c10, epoch_num: int = 108):
        """
        Default use 108 epoch for c10, this is the largest epoch number.
        :param dataset:
        :param arch_id: architecture id
        :param epoch_num: query the result of the specific epoch number
        :return:
        """
        self.load_101()
        if dataset != Config.c10:
            raise "NB101 only have c10 results"

        if epoch_num is None or epoch_num > 108:
            epoch_num = 108
        elif epoch_num > 36:
            epoch_num = 36
        elif epoch_num > 12:
            epoch_num = 12
        elif epoch_num > 4:
            epoch_num = 4
        else:
            epoch_num = 4
        arch_id = str(arch_id)
        # this is acc from zero-cost paper, which only record 108 epoch' result [test, valid, train]
        # t_acc = self.data101_from_zerocost[self.id_to_hash_map[arch_id]][0]
        # this is acc from parse_testacc_101.py,
        t_acc_usage = self.data101_full[arch_id][Config.c10][str(epoch_num)]["test-accuracy"]
        time_usage = self.data101_full[arch_id][Config.c10][str(epoch_num)]["time_usage"]
        # print(f"[Debug]: Acc different = {t_acc_usage - t_acc}")
        return t_acc_usage, time_usage

    def count_models(self):
        return len(self.data101_from_zerocost)

    @classmethod
    def guess_score_time(cls):
        return random.randint(1169, 1372) * 0.0001

    def guess_train_one_epoch_time(self):
        # only have information for 4 epoch
        self.load_101()

        d = dict.fromkeys(self.data101_full)
        keys = random.sample(list(d), 15000)

        # pick the max value over 5k arch training time
        res = 0
        for rep_time in range(15000):
            arch_id = keys[rep_time]
            _, time_usage = self.get_c10_test_info(arch_id=arch_id, dataset=Config.c10, epoch_num=4)
            if time_usage > res:
                res = time_usage
        return res


if __name__ == "__main__":

    # 101 time measurement
    begin_time101 = time.time()
    gt101_ins = Gt101()
    test_accuracy, time_usage = gt101_ins.get_c10_test_info(arch_id=str(123))
    end_time = time.time()
    print(test_accuracy, time_usage, end_time - begin_time101)

    # 201 time measurement
    gt201_ins = Gt201()
    begin_time201 = time.time()
    test_accuracy, time_usage = gt201_ins.query_12_epoch(arch_id=str(35), dataset=Config.c10_valid)
    end_time = time.time()
    print(test_accuracy, time_usage, end_time - begin_time201)

    res = []
    for arch in range(1, 15615):
        res.append(gt201_ins.query_200_epoch(arch_id=str(arch), dataset=Config.c10_valid)[0])

    print("Max accuracy in NB201 with c10_valid is ", max(res))
