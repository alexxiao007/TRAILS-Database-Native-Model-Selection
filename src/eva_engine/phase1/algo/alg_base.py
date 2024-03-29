import math
import time
from abc import abstractmethod
import torch
from torch import nn


class Evaluator:
    def __init__(self):
        pass

    @abstractmethod
    def evaluate(self, arch: nn.Module, device, batch_data: object, batch_labels: torch.Tensor) -> float:
        """
        Score each architecture with predefined architecture and data
        :param arch: architecture to be scored
        :param device:  cpu or gpu
        :param batch_data: a mini batch of data, [ batch_size, channel, W, H ] or dict for structure data
        :param batch_labels: a mini batch of labels
        :return: score
        """
        raise NotImplementedError

    def evaluate_wrapper(self, arch, device,
                         batch_data: torch.tensor, batch_labels: torch.tensor) -> (float, float):
        """
        :param arch: architecture to be scored
        :param device: cpu or GPU
        :param batch_data: a mini batch of data, [ batch_size, channel, W, H ]
        :param batch_labels: a mini batch of labels
        :return: score, timeUsage
        """

        arch.train()
        arch.zero_grad()

        # gpu_util_begin = showUtilization()
        start = time.time()
        score = self.evaluate(arch, device, batch_data, batch_labels)
        if math.isnan(score):
            if score > 0:
                score = 1e8
            else:
                score = -1e8
        if math.isinf(score):
            if score > 0:
                score = 1e8
            else:
                score = -1e8

        score = round(score, 2)
        end = time.time()
        # gpu_util_end = showUtilization()

        torch.cuda.empty_cache()

        return score, end-start
