import os
import os.path
import shutil
import xml.etree.ElementTree as et
'''
生成Annotation和JPEGImages
'''
# fileDir_ann = "E:\\voc_year\\VOCdevkit\\VOC2007\\Annotations"
# fileDir_img = "E:\\voc_year\\VOCdevkit\\VOC2007\\JPEGImages\\"
# saveDir_img = "E:\\voc_year\\VOCdevkit\\VOC2007\\JPEGImages_ssd\\"

#fileDir_ann = "../datasets_voc/2007/VOCdevkit/VOC2007/Annotations"
fileDir_ann = "../datasets_voc/2012/VOCdevkit/VOC2012/Annotations"
#fileDir_img = "../datasets_voc/2007/VOCdevkit/VOC2007/JPEGImages/"
fileDir_img = "../datasets_voc/2012/VOCdevkit/VOC2012/JPEGImages/"
#saveDir_img = "../datasets_voc/2007/VOCdevkit/VOC2007/JPEGImages_ssd7/"
saveDir_img = "../datasets_voc/2012/VOCdevkit/VOC2012/JPEGImages_ssd7/"

if not os.path.exists(saveDir_img):
    os.mkdir(saveDir_img)

classes = ('bicycle', 'boat', 'bus', 'car','motorbike', 'train', 'person')
for files in os.walk(fileDir_ann):
    for file in files[2]:

        print(file + "-->start!")
        

        # saveDir_ann = "E:\\voc_year\\VOCdevkit\\VOC2007\\Annotations_ssd\\"
        #saveDir_ann = "../datasets_voc/2007/VOCdevkit/VOC2007/Annotations_ssd7/"
        saveDir_ann = "../datasets_voc/2012/VOCdevkit/VOC2012/Annotations_ssd7/"
        if not os.path.exists(saveDir_ann):
            os.mkdir(saveDir_ann)

        path = fileDir_ann + '/' + file
        tree = et.parse(path)
        root=tree.getroot()
        saveDir_ann = saveDir_ann + file
        count=0

        for c1 in list(root.iter('object')):
            name=c1.find('name')
            if name.text in classes:
                count+=1
                if name.text == 'person':
                    for c2 in list(c1.findall('part')):
                        c1.remove(c2)
            else:
                root.remove(c1)
        if count>0:
            tree = et.ElementTree(root)
            tree.write(saveDir_ann, encoding="utf-8", xml_declaration=False)
            name_img = fileDir_img + os.path.splitext(file)[0] + ".jpg"
            shutil.copy(name_img, saveDir_img)
        print(file + "-->end!")
