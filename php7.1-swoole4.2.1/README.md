# php7.1-swoole4.2.1

## 构建
```bash
docker build -t php-swoole:7.1-4.2.1 dockerfiles/php7.1-swoole4.2.1/
```

## 运行
```bash
docker run -it --name php-swoole php-swoole:7.1-4.2.1 bash
```

## 不同运行模式
swoole 支持不同方式的运行模式，更改`docker-entrypoint.sh`将此 Dockerfile 的守护进程更改为 swoole 的启动脚本即可。
> 在`dockerfiles/php7.1-swoole4.2.1/servers/`目录下存放了标准的集中 swoole 不同运行模式的启动脚本。