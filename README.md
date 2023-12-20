# gb 旧项目工具打包

- Golang:1.9.3
- gb 0.4.4

## 拉取镜像

```sh
docker pull isfk/gogb:latest
```

## gb 编译项目

```sh
docker run --rm -it -v $(pwd):/project isfk/gogb
```

## 使用 gb

```sh
docker run -v $(pwd):/project --rm  --entrypoint=gb isfk/gogb info
docker run -v $(pwd):/project --rm  --entrypoint=gb isfk/gogb list
docker run -v $(pwd):/project --rm  --entrypoint=gb isfk/gogb vendor fetch {pkg-name}
# docker run -v $(pwd):/project --rm  --entrypoint=gb isfk/gogb vendor fetch -tag v7.11.1 github.com/qiniu/go-sdk
# docker run -v $(pwd):/project --rm  --entrypoint=gb isfk/gogb vendor fetch -tag v10.11.0 github.com/go-playground/validator
```

## 参考

- https://github.com/constabulary/gb

## Dockerfile

```
FROM golang:1.9.3

LABEL name="GB-IN-Go193"

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Install gb.
RUN go get github.com/constabulary/gb/... && \
    go install github.com/constabulary/gb

VOLUME ["/project"]

WORKDIR /project/

CMD ["./build.sh"]
```
