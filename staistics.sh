#!/bin/bash

if [ -z $1 ]
then
    echo "请输入要统计的文件路径"
    exit
fi

if [ ! -e $1 ]
then
    echo "文件不存在"
    exit
fi

staistics()
{
    echo > tmp.txt
    local count="0"
    for char in {a..z}
    do
        count=`grep -io $char $1 | wc -l`
	echo $char:$count | tr /a-z/ /A-Z/ >> tmp.txt
    done
    sort -rn -k 2 -t : tmp.txt
}
staistics $1
