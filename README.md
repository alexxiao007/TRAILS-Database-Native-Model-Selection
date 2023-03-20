

# Create new environment for it.

conda create -n "firmest" python=3.6.13
conda activate firmest
pip install -r requirements.txt


# config the python path

    export PYTHONPATH=$PYTHONPATH:./src
    export PATH="$PATH:./src"
    export PYTHONPATH=$PYTHONPATH:./third_party
    export PATH="$PATH:./third_party"
    export PYTHONPATH=$PYTHONPATH:./exps/main_ijcai/
    export PATH="$PATH:./exps/main_ijcai/"
    export PYTHONPATH=$PYTHONPATH:./exps/main_ijcai/0_local_api/
    export PATH="$PATH:./exps/main_ijcai/0_local_api/"
    export PYTHONPATH=$PYTHONPATH:./exps/main_ijcai/2_verify_sampler/
    export PATH="$PATH:./exps/main_ijcai/2_verify_sampler/"
    export PYTHONPATH=$PYTHONPATH:./exps/main_ijcai/3_benchmark_sampler/
    export PATH="$PATH:./exps/main_ijcai/3_benchmark_sampler/"
    export PYTHONPATH=$PYTHONPATH:./exps/main_ijcai/statistic_lib/
    export PATH="$PATH:./exps/main_ijcai/statistic_lib/"
    export PYTHONPATH=$PYTHONPATH:./exps/main_ijcai/apiserver/
    export PATH="$PATH:./exps/main_ijcai/apiserver/"

# run one example

    python main.py