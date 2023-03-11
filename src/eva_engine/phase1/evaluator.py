

import torch
from common.constant import Config, CommonVars
from common.structure import ModelAcquireData
from eva_engine import evaluator_register
from search_space import NasBench101Space, NasBench201Space
from storage import dataset


class P1Evaluator:

    def __init__(self, device, num_labels, search_space, train_loader):
        self.search_space = search_space
        self.device = device
        self.train_loader = train_loader
        self.num_labels = num_labels

    def p1_evaluate(self, data_str: str) -> dict:
        """
        :param data_str: encoded ModelAcquireData
        :return:
        """

        # get a random batch.
        mini_batch, mini_batch_targets = dataset.get_mini_batch(
            dataloader=self.train_loader,
            sample_alg="random",
            batch_size=32,
            num_classes=self.num_labels)

        model_acquire = ModelAcquireData.deserialize(data_str)
        return self._p1_evaluate(model_acquire.model_encoding, mini_batch, mini_batch_targets)

    def _p1_evaluate(self,
                     model_encoding: str,
                     mini_batch: torch.tensor,
                     mini_batch_targets: torch.tensor) -> dict:

        # 0. identify the load model method
        cfg_load_method = None
        if self.search_space == Config.NB101:
            cfg_load_method = self._load_101_cfg
        elif self.search_space == Config.NB201:
            cfg_load_method = self._load_201_cfg
        else:
            raise NotImplementedError

        # 1. Score NasWot
        new_model = cfg_load_method(model_encoding, bn=True)
        new_model = new_model.to(self.device)
        naswot_score, _ = evaluator_register[CommonVars.NAS_WOT].evaluate_wrapper(
            arch=new_model,
            device=self.device,
            batch_data=mini_batch,
            batch_labels=mini_batch_targets)

        # 2. Score SynFlow
        new_model = cfg_load_method(model_encoding, bn=False)
        new_model = new_model.to(self.device)
        synflow_score, _ = evaluator_register[CommonVars.PRUNE_SYNFLOW].evaluate_wrapper(
            arch=new_model,
            device=self.device,
            batch_data=mini_batch,
            batch_labels=mini_batch_targets)

        # 3. combine the result and return
        model_score = {CommonVars.NAS_WOT: naswot_score,
                       CommonVars.PRUNE_SYNFLOW: synflow_score}

        return model_score

    def _load_101_cfg(self, model_encoding: str, bn: bool):
        matrix, operations = NasBench101Space.deserialize_model_encoding(model_encoding)
        return NasBench101Space.new_architecture_default(matrix, operations, bn, self.num_labels)

    def _load_201_cfg(self, model_encoding: str, bn: bool):
        return NasBench201Space.new_architecture_default(model_encoding, bn, self.num_labels)
