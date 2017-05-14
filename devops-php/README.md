# devops-php
开箱即用的php web开发环境。

## 容器编排
可以直接执行`docker-composer up -d`命令编排容器。

- 默认开放80:80端口作为web访问。
- 默认属主机下~/data/www与容器/www目录挂载。
- mysql默认使用`mysql`作为host。
