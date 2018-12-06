DATASET_DIR=../datasets_tf_7/
TRAIN_DIR=/mnt/data1/zhangwei/ssd_vgg16_7_model_4_continue3
#CHECKPOINT_PATH=../checkpoints/vgg_16.ckpt
CHECKPOINT_PATH=/mnt/data1/zhangwei/ssd_vgg16_7_model_3_lr001/model.ckpt-13524
python ../train_ssd_network.py \
  --train_dir=${TRAIN_DIR} \
  --dataset_dir=${DATASET_DIR} \
  --dataset_name=pascalvoc_2007 \
  --dataset_split_name=train \
  --model_name=ssd_300_vgg \
  --checkpoint_path=${CHECKPOINT_PATH} \
  --save_summaries_secs=60 \
  --save_interval_secs=600 \
  --weight_decay=0.0005 \
  --optimizer=adam \
  --learning_rate=0.005 \
  --learning_rate_decay_factor=0.94 \
  --batch_size=24 \
  --gpu_memory_fraction=0.9


