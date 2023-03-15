

from controller.core.sample import Sampler
from search_space.core.space import SpaceWrapper
from search_space.core.model_params import ModelMicroCfg
from third_party.models import CellStructure


class RandomSampler(Sampler):

    def __init__(self, space: SpaceWrapper, args):
        super().__init__(space)
        self.visited = []

    def sample_next_arch(self, max_nodes: int) -> (str, ModelMicroCfg):
        while True:
            arch_id, arch_struc = self.space.random_architecture_id(max_nodes)

            if arch_id not in self.visited:
                self.visited.append(arch_id)
                yield str(arch_id), arch_struc

    def fit_sampler(self, score: float):
        # random sampler can skip this.
        pass
