# this is the main function of model selection.

import calendar
import os
import time
from common.constant import Config
from storage.structure_data_loader import libsvm_dataloader
from exps.main_v2.common.shared_args import parse_arguments


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

    rms = RunModelSelection(args.search_space,  args, is_simulate=False)
    best_arch, _, _, _, _ = rms.select_model_online(time_budget, data_loader)

    return best_arch


if __name__ == "__main__":
    args = parse_arguments()

    # set the log name
    gmt = time.gmtime()
    ts = calendar.timegm(gmt)
    os.environ.setdefault("log_file_name", args.log_name + "_" + str(ts) + ".log")
    os.environ.setdefault("base_dir", args.base_dir)

    from eva_engine.run_ms import RunModelSelection
    from storage import dataset

    run_with_time_budget(args.budget)
