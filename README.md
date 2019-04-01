# DOCKERFILES
Dockerfile文件集合

基于易于维护为原则，此dockerfiles下所有环境都是通过Centos7构建编写。

包含php、nginx、ganache、geth及一些工具类的Dockerfile。目前通过此dockerfiles可以轻松构建lnmp开发环境、以太坊开发环境和相关持续集成环境。

您可以阅读[你离区块链智能合约开发只有一句docker-compose的距离](https://www.chongdongshequ.com/article/1540732925395.html)来构建自己的以太坊开发环境。

## TOC

- build-andriod
Andriod 编译环境，用于持续集成

- build-php
PHP 编译环境，用于持续集成

- cosmigration
包含腾讯云cos迁移命令的容器

- ganache
以太坊节点仿真环境

- geth
以太坊客户端

- ldap
LDAP容器

- nginx
nginx官方版本

- nginx-stream
支持4层转发的nginx官方版本

- openresty
支持lua脚本的nginx容器

- php5.6

- php7.1

- php7.1-swoole4.2.1

- php7.1-workerman

- php7.2

- php7.3

- tengine
阿里开源nginx版本，支持lua

- truffle
以太坊开发框架
