#!/bin/bash
read -p "输入别名 版本号 dockerfile路径：" name tag path
docker build -t "$name":"$tag" "$path"
