DATASET_DIR=/home/pengkun/zhangwei/SSD-Tensorflow-7/datasets_voc/2007/VOCdevkit/VOC2007-7-new/
OUTPUT_DIR=/home/pengkun/zhangwei/SSD-Tensorflow-7/datasets_tf_7
python ../tf_convert_data.py --dataset_name=pascalvoc --dataset_dir=${DATASET_DIR} --output_name=voc_2007_train --output_dir=${OUTPUT_DIR}
