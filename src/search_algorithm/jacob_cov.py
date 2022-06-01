import numpy as np

from search_algorithm.core.evaluator import Evaluator
from search_algorithm.utils.autograd_hacks import *
from search_space import Architecture


class JacobConvEvaluator(Evaluator):

    def __init__(self):
        super().__init__()

    def evaluate(self, arch: Architecture, pre_defined, batch_data: torch.tensor, batch_labels: torch.tensor) -> float:
        """
        This is another implementation of paper "Neural Architecture Search without Training"
        This is from implementation of paper "ZERO-COST PROXIES FOR LIGHTWEIGHT NAS"
        The score takes 5 steps:
            1. for ech example, get the binary vector for each relu layer, where 1 means x > 0, 0 otherwise,
            2. calculate K = [Na - hamming_distance (ci, cj) for each ci, cj]
        """

        split_data = 1

        # Compute gradients (but don't apply them)
        arch.zero_grad()

        jacobs = self.get_batch_jacobian(arch, batch_data, split_data=split_data)
        jacobs = jacobs.reshape(jacobs.size(0), -1).cpu().numpy()

        try:
            jc = self.eval_score(jacobs)
        except Exception as e:
            print(e)
            jc = np.nan

        return jc

    def get_batch_jacobian(self, net, x, split_data):
        x.requires_grad_(True)

        N = x.shape[0]
        for sp in range(split_data):
            st = sp * N // split_data
            en = (sp + 1) * N // split_data
            y = net(x[st:en])
            y.backward(torch.ones_like(y))

        jacob = x.grad.detach()
        x.requires_grad_(False)
        return jacob

    def eval_score(self, jacob):
        corrs = np.corrcoef(jacob)
        v, _ = np.linalg.eig(corrs)
        k = 1e-5
        return -np.sum(np.log(v + k) + 1. / (v + k))

