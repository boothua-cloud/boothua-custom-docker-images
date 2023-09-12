## Why create such a library?
Because the official image can not meet my needs, for example, it does not support arm64, and I may not have the software I need, so I need to customize the image, so I will make a record here, which is convenient for everyone to use.
## How to use?
You just need to clone my library or download the dockerfile you need to your local, and then build to get the image you need.
### How to build?
Take dante as an example.
```shell
docker buildx build -f dante.dockerfile --platform linux/amd64,linux/arm64 -t xxx.xxx.xxx/library/dante:latest . --push
```
xxx.xxx.xxx is the address of your docker image repository, such as harbor
If you don't have a private repository, save the image locally.
```shell
docker build -f dante.dockerfile -t dante:latest . 
```
## What's here?
- dante
- Adding ...
# If you think this is useful to you, please give me a star. Thank you!
