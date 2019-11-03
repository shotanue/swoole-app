# Docker

``` bash
docker image pull docker.pkg.github.com/shotanue/swoole-app/docker:7.3-alpine3.10
``` 

An alpine based php-docker-image, which includes C extensions below.

#### Extensions

- [Swoole](https://github.com/swoole/swoole-src)

- xdebug(`-dev` image only)


### Images for development

The images tagged with suffix(`-dev`) includes xdebug.

#### example 
```bash
docker image push docker.pkg.github.com/shotanue/swoole-app/docker-dev:7.3-alpine3.10
```


## Tags
- 7.3-alpine3.10
