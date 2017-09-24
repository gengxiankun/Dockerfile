# docker_builder
围绕PHP周边服务的Dockerfile

## docker-compose
修改yml文件来调整持久化目录及端口。使用`docker-compose -f **.yml up -d`指定yml文件运行你想要运行的服务。

## 服务列表
- web-stack-compose.yml：集成PHP、OpenResty、MySQL的WEB服务
- gitlab-stack-compose.yml：GitLab服务
- jenkins-compose.yml：Jenkins服务
- elk-stack-compose.yml：ELK服务
- ./XHGui/Dockerfile：基于Tideways扩展，无侵入式的PHP性能分析工具
