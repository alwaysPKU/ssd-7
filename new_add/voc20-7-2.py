import os
import random

trainval_percent = 0.5
train_percent = 0.5
xmlfilepath = '../datasets_voc/2007/VOCdevkit/VOC2007-7/Annotations'
txtsavepath = '../datasets_voc/2007/VOCdevkit/VOC2007-7/ImageSets/Main'
total_xml = os.listdir(xmlfilepath)
if not os.path.exists(txtsavepath):
    os.makedirs(txtsavepath)

num=len(total_xml) # xml文件个数，也是图片个数(6270)
list=range(num)
tv=int(num*trainval_percent) #traival占比个数
tr=int(tv*train_percent)    #train占比个数
trainval= random.sample(list,tv)
train=random.sample(trainval,tr)

ftrainval = open(txtsavepath+'/trainval.txt', 'w')
ftest = open(txtsavepath+'/test.txt', 'w')
ftrain = open(txtsavepath+'/train.txt', 'w')
fval = open(txtsavepath+'/val.txt', 'w')

for i in list:
    name=total_xml[i][:-4]+'\n'
    if i in trainval:
        ftrainval.write(name)
        if i in train:
            ftrain.write(name)
        else:
            fval.write(name)
    else:
        ftest.write(name)

ftrainval.close()
ftrain.close()
fval.close()
ftest .close()
