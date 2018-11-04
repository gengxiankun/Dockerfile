# dockerfiles
dockerfiles are used to build centos7 based docker images.

dockerfiles automatically triggers the build process in https://hub.docker.com, so they are always consistent with the image in https://hub.docker.com/r/gengxiankun/.

## container arrangement
dockerfiles provides docker-compose orchestration files for these images. 

these files are placed in the [docker-compose_yaml](docker-compose_yaml/) directory. 

select the file you want to run. Run the command: `docker-compose -f docker-compose_yaml/xxx.yaml up -d` will start.

## related articles
- [你离区块链智能合约开发只有一句docker-compose的距离](https://www.chongdongshequ.com/article/1540732925395.html)