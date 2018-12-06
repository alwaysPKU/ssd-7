DATASET_DIR=/home/pengkun/zhangwei/SSD-Tensorflow-7/datasets_voc/2012/VOCdevkit/VOC2012-7/
OUTPUT_DIR=/home/pengkun/zhangwei/SSD-Tensorflow-7/datasets_tf2012_7
python ../tf_convert_data.py --dataset_name=pascalvoc --dataset_dir=${DATASET_DIR} --output_name=voc_2012_test --output_dir=${OUTPUT_DIR}
