FROM golang:1.8 AS builder

WORKDIR $gopath/hello

COPY hello.go .

RUN go build -o hello.go .

FROM scratch

WORKDIR /hello

COPY --from=builder $gopath/hello/hello.go .

CMD ["./hello.go"]