




# XAI: 25 jobs
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=0     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=1     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:2     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=2     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:3     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=3     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:4     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=4     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:5     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=5     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&


# pandaX1 - 4 train jobs.
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=24     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=25     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:2     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=26     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:3     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=27     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&

# panda6 : 2GPU | NVIDIA-SMI 470.161.03   Driver Version: 470.161.03   CUDA Version: 11.4
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=28     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=29     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&


# panda7: 1GPU  | NVIDIA-SMI 460.67       Driver Version: 460.67       CUDA Version: 11.2
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=30     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=31     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&


# panda10: NVIDIA-SMI 470.161.03   Driver Version: 470.161.03   CUDA Version: 11.4
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=34     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=35     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&

# panda11: NVIDIA-SMI 470.161.03   Driver Version: 470.161.03   CUDA Version: 11.4
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=36     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=37     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&


# panda13: NVIDIA-SMI 470.161.03   Driver Version: 470.161.03   CUDA Version: 11.4

nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=41     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&


# panda14: NVIDIA-SMI 470.161.03   Driver Version: 470.161.03   CUDA Version: 11.4
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=42     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=43     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&

# panda15: NVIDIA-SMI 470.161.03   Driver Version: 470.161.03   CUDA Version: 11.4
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=44     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=45     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&

# panda16 (65): NVIDIA-SMI 470.161.03   Driver Version: 470.161.03   CUDA Version: 11.4     |
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=46     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=47     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&

# panda17 (250-GB): NVIDIA-SMI 470.129.06   Driver Version: 440.33.01    CUDA Version: 10.2
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=48     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=49     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&


# Failed: panda8: NVIDIA-SMI 460.56       Driver Version: 460.56       CUDA Version: 11.2
# Assigned to XAI now
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:5     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=32     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&

# 03/28 -> Assigned to panda6 now
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=33     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=50     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&

# Assigned to Panda17 now
# panda12: NVIDIA-SMI 470.161.03   Driver Version: 470.161.03   CUDA Version: 11.4




# 03/28 -> Assigned to panda7 now
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=51     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=6     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&


# left from the XAI.

# 03/28 -> Assigned to panda8 now
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=7     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=8     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&

# 03/28 -> Assigned to panda10 now
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=9     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=10     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&

# 03/28 -> Assigned to panda11 now
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=11     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=12     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&

# 03/28 -> Assigned to panda12 now
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=13     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&

# 03/28 -> Assigned to panda13 now
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=14     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=15     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&

# 03/28 -> Assigned to panda14 now
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=16     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=17     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&

# 03/28 -> Assigned to panda16 now
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=18     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=19     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&




nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=20     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=21     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&


nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=22     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=23     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&



#  ============ ALl those are left ============
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=40     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:0     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=38     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&
nohup python exps/main_sigmod/ground_truth/2.seq_train_online.py      --log_name=baseline_train_based     --search_space=mlp_sp     --num_layers=4     --hidden_choice_len=10     --base_dir=../firmest_data/     --num_labels=1     --device=cuda:1     --batch_size=1024     --lr=0.001     --epoch=10     --iter_per_epoch=2000     --dataset=criteo     --nfeat=2100000     --nfield=39     --nemb=10     --worker_id=39     --total_workers=52     --workers=0     --log_folder=LogCriteo     --total_models_per_worker=-1     --pre_partitioned_file=./exps/main_sigmod/ground_truth/sampled_models_10000_models.json > output.log&