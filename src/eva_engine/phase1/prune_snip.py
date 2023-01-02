

from eva_engine.phase1.evaluator_base import Evaluator
from .utils.autograd_hacks import *
from .utils.p_utils import get_layer_metric_array
 
import types


class SnipEvaluator(Evaluator):

    def __init__(self):
        super().__init__()

    def evaluate(self, arch: nn.Module, device, batch_data: torch.tensor, batch_labels: torch.tensor) -> float:
        """
        This is implementation of paper
        "SNIP: SINGLE -SHOT NETWORK PRUNING BASED ON CONNECTION SENSITIVITY"
        """

        split_data = 1
        N = batch_data.shape[0]

        # update module's forward and backward function
        self._update_module_compute(arch)

        # Compute gradients (but don't apply them)

        # run a forward + backward on mini-batch， spit data if it cannot fit into one GPU
        for sp in range(split_data):
            st = sp * N // split_data
            en = (sp + 1) * N // split_data

            outputs = arch.forward(batch_data[st:en])
            loss = F.cross_entropy(outputs, batch_labels[st:en])
            loss.backward()

        # select the gradients that we want to use for search/prune
        def snip(layer):
            if layer.weight_mask.grad is not None:
                return torch.abs(layer.weight_mask.grad)
            else:
                return torch.zeros_like(layer.weight)

        grads_abs = get_layer_metric_array(arch, snip, "param")

        # Sum over all parameter's results to get the final score.
        score = 0.
        for i in range(len(grads_abs)):
            score += grads_abs[i].detach().cpu().numpy().sum()
        return score

    def _update_module_compute(self, arch):
        # override the computation, where self is the layer,
        # assign a master vector to the weight,
        def snip_forward_conv2d(self, x):
            return F.conv2d(x, self.weight * self.weight_mask, self.bias,
                            self.stride, self.padding, self.dilation, self.groups)

        def snip_forward_linear(self, x):
            return F.linear(x, self.weight * self.weight_mask, self.bias)

        # for each layer, do the replacement,
        for layer in arch.modules():
            if isinstance(layer, nn.Conv2d) or isinstance(layer, nn.Linear):
                layer.weight_mask = nn.Parameter(torch.ones_like(layer.weight))
                layer.weight.requires_grad = False

            # Override the forward methods:
            if isinstance(layer, nn.Conv2d):
                layer.forward = types.MethodType(snip_forward_conv2d, layer)

            if isinstance(layer, nn.Linear):
                layer.forward = types.MethodType(snip_forward_linear, layer)
        return
