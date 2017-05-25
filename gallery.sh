#!/bin/bash
#是否有自定义文件生成名，没有的话默认gallery.html
output=""
if [ -z $1 ]
then
    output="gallery.html"
else
    output=$1
fi
#创建文件
echo "" > $output
#创建放缩略图的文件夹
if [ ! -e thumbnails ]
then
    mkdir thumbnails
fi

echo "<!DOCTYPE html>
  <head>
    <title>My Gallery</title>
  </head>
  <body>
    <p>" >> $output

for image in `ls image | egrep ".jpg|.jpeg" `
do
    echo "image/$image"
done

for image in `ls image | egrep ".jpg|.jpeg"`
do
    newImage="./thumbnails/thumbnail-$image"
    convert image/$image -thumbnail '200x200' $newImage
    echo "<a href='./image/$image'><img src='$newImage' /></a>" >> $output
done

echo "</p></body></html>" >> $output
