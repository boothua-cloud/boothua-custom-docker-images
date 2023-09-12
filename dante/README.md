### Dante Overview
Dante is a product developed by Inferno Nettverk A/S. It consists of a SOCKS server and a SOCKS client, implementing RFC 1928 and related standards. It is a flexible product that can be used to provide convenient and secure network connectivity.
### Why create this image
Since the official dante image does not support the arm64 architecture of the cpu, here I myself based on the [official source](https://www.inet.no/dante/download.html) code to build a support arm64/amd64 dante image
### docker-compose run
```yaml
version: '3'
services:
  dante:
    image: harbor.haiyucloud.cn/library/dante
    container_name: dante
    hostname: dante
    restart: always
    ports:
      - "1080:1080"
    volumes:
      - ./sockd.conf:/etc/sockd.conf
```
### docker run
```shell
docker run -itd --name dante -p 1080:1080 boothua/dante:latest
```
#### [Dockerfile](https://github.com/boothua-cloud/boothua-custom-docker-images/tree/main/dante) is here.