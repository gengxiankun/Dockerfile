#!/usr/bin/env bash
#xiankun.geng

for file in ./*
do
	if test -d $file
	then
		echo $file
	fi
done
read -p "输入构建的目录：" build_file
read -p "输入构建的镜像别名：" build_name
read -p "输入构建的镜像版本号：" build_tag

docker build -t $build_name:$build_tag $build_file
