import time

import torch
import torch.nn as nn
from torch import optim
from torch.utils.data import DataLoader
from utilslibs import utils


class ModelTrainer:

    @classmethod
    def fully_train_arch(cls,
                         model: nn.Module,
                         use_test_acc: bool,
                         epoch_num,
                         train_loader: DataLoader,
                         val_loader: DataLoader,
                         test_loader: DataLoader,
                         args,
                         logger=None
                         ) -> (float, float, dict):
        """
        Args:
            model:
            use_test_acc:
            epoch_num: how many epoch, set by scheduler
            train_loader:
            val_loader:
            test_loader:
            args:
        Returns:
        """

        if logger is None:
            from logger import logger
            logger = logger

        start_time, best_valid_auc = time.time(), 0.

        # training params
        device = args.device
        num_labels = args.num_labels
        lr = args.lr
        iter_per_epoch = args.iter_per_epoch
        # report_freq = args.report_freq
        # given_patience = args.patience

        # assign new values
        args.epoch_num = epoch_num
        # optimizer
        # print("loading opt_metric to GPU...")
        # for multiple classification
        # opt_metric = nn.CrossEntropyLoss(reduction='mean').to(device)
        # opt_metric = nn.BCELoss(reduction='mean').to(device)
        opt_metric = nn.BCEWithLogitsLoss(reduction='mean').to(device)

        optimizer = optim.Adam(model.parameters(), lr=lr)
        scheduler = optim.lr_scheduler.CosineAnnealingLR(
            optimizer,
            T_max=epoch_num,  # Maximum number of iterations.
            eta_min=1e-4)     # Minimum learning rate.

        # gradient clipping, set the gradient value to be -1 - 1
        for p in model.parameters():
            p.register_hook(lambda grad: torch.clamp(grad, -1., 1.))

        info_dic = {}
        valid_auc = -1
        for epoch in range(epoch_num):
            logger.info(f'Epoch [{epoch:3d}/{epoch_num:3d}]')
            # train and eval
            # print("begin to train...")
            train_auc, train_loss = ModelTrainer.run(logger,
                epoch, iter_per_epoch, model, train_loader, opt_metric, args, optimizer=optimizer, namespace='train')
            scheduler.step()

            # print("begin to evaluate...")
            valid_auc, valid_loss = ModelTrainer.run(logger,
                                                     epoch, iter_per_epoch, model, val_loader,
                                                     opt_metric, args, namespace='val')

            if use_test_acc:
                test_auc, test_loss = ModelTrainer.run(logger,
                                                       epoch, iter_per_epoch, model, test_loader,
                                                       opt_metric, args, namespace='test')
            else:
                test_auc = -1

            info_dic[epoch] = {
                "train_auc": train_auc,
                "valid_auc": valid_auc,
                "train_loss": train_loss,
                "valid_loss": valid_loss,
                "train_val_total_time": time.time() - start_time}

            # record best auc and save checkpoint
            if valid_auc >= best_valid_auc:
                best_valid_auc, best_test_auc = valid_auc, test_auc
                logger.info(f'best valid auc: valid {valid_auc:.4f}, test {test_auc:.4f}')
            else:
                logger.info(f'valid {valid_auc:.4f}, test {test_auc:.4f}')

        return valid_auc, time.time() - start_time, info_dic

    #  train one epoch of train/val/test
    @classmethod
    def run(cls, logger, epoch, iter_per_epoch, model, data_loader, opt_metric, args, optimizer=None, namespace='train'):
        if optimizer:
            model.train()
        else:
            model.eval()

        time_avg, timestamp = utils.AvgrageMeter(), time.time()
        loss_avg, auc_avg = utils.AvgrageMeter(), utils.AvgrageMeter()

        for batch_idx, batch in enumerate(data_loader):
            # if suer set this, then only train fix number of iteras
            # stop training current epoch for evaluation
            if namespace == 'train' and iter_per_epoch is not None and batch_idx >= iter_per_epoch:
                break

            target = batch['y'].to(args.device)
            batch['id'] = batch['id'].to(args.device)
            batch['value'] = batch['value'].to(args.device)

            if namespace == 'train':
                y = model(batch)
                loss = opt_metric(y, target)

                optimizer.zero_grad()
                loss.backward()
                optimizer.step()
            else:
                with torch.no_grad():
                    y = model(batch)
                    loss = opt_metric(y, target)

            # for multiple classification
            # auc = utils.roc_auc_compute_fn(torch.nn.functional.softmax(y, dim=1)[:, 1], target)
            auc = utils.roc_auc_compute_fn(y, target)
            loss_avg.update(loss.item(), target.size(0))
            auc_avg.update(auc, target.size(0))

            time_avg.update(time.time() - timestamp)
            timestamp = time.time()
            if batch_idx % args.report_freq == 0:
                logger.info(f'Epoch [{epoch:3d}/{args.epoch_num}][{batch_idx:3d}/{len(data_loader)}]\t'
                            f'{time_avg.val:.3f} ({time_avg.avg:.3f}) AUC {auc_avg.val:4f} ({auc_avg.avg:4f}) '
                            f'Loss {loss_avg.val:8.4f} ({loss_avg.avg:8.4f})')

        logger.info(f'{namespace}\tTime {utils.timeSince(s=time_avg.sum):>12s} '
                    f'AUC {auc_avg.avg:8.4f} Loss {loss_avg.avg:8.4f}')
        return auc_avg.avg, loss_avg.avg

