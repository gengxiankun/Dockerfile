# dockerfiles
[![Build Status](https://travis-ci.org/gengxiankun/dockerfiles.svg?branch=master)](https://travis-ci.org/gengxiankun/dockerfiles)

dockerfiles用于构建基于centos7的docker镜像。

dockerfiles还为有些镜像提供docker-compose编排文件，这些文件放在[docker-compose_yaml](docker-compose_yaml/)目录中，选择要运行的文件，运行命令：`docker-compose -f docker-compose_yaml/xxx.yaml up -d` 将它们启动。

## 相关阅读
- [你离区块链智能合约开发只有一句docker-compose的距离](https://www.chongdongshequ.com/article/1540732925395.html)