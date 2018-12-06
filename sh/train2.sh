DATASET_DIR=../datasets_tf_7/
TRAIN_DIR=/mnt/data1/zhangwei/ssd_vgg16_7_model_3_lr001
CHECKPOINT_PATH=../checkpoints/vgg_16.ckpt
#CHECKPOINT_PATH=/mnt/data1/zhangwei/ssd_vgg16_7_model/model.ckpt-14744
python ../train_ssd_network.py \
  --train_dir=${TRAIN_DIR} \
  --dataset_dir=${DATASET_DIR} \
  --dataset_name=pascalvoc_2007 \
  --dataset_split_name=train \
  --model_name=ssd_300_vgg \
  --checkpoint_path=${CHECKPOINT_PATH} \
  --checkpoint_model_scope=vgg_16 \
  --checkpoint_exclude_scopes=ssd_300_vgg/conv6,ssd_300_vgg/conv7,ssd_300_vgg/block8,ssd_300_vgg/block9,ssd_300_vgg/block10,ssd_300_vgg/block11,ssd_300_vgg/block4_box,ssd_300_vgg/block7_box,ssd_300_vgg/block8_box,ssd_300_vgg/block9_box,ssd_300_vgg/block10_box,ssd_300_vgg/block11_box \
  --trainable_scopes=ssd_300_vgg/conv6,ssd_300_vgg/conv7,ssd_300_vgg/block8,ssd_300_vgg/block9,ssd_300_vgg/block10,ssd_300_vgg/block11,ssd_300_vgg/block4_box,ssd_300_vgg/block7_box,ssd_300_vgg/block8_box,ssd_300_vgg/block9_box,ssd_300_vgg/block10_box,ssd_300_vgg/block11_box \
  --save_summaries_secs=60 \
  --save_interval_secs=600 \
  --weight_decay=0.0005 \
  --optimizer=adam \
  --learning_rate=0.005 \
  --learning_rate_decay_factor=0.94 \
  --batch_size=24 \
  --gpu_memory_fraction=0.9


