FROM golang:1.9.3

LABEL name="GB-IN-Go193"

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Install gb.
RUN go get github.com/constabulary/gb/... && \
    go install github.com/constabulary/gb

VOLUME ["/project"]

WORKDIR /project/

CMD ["./build.sh"]