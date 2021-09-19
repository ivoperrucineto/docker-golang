FROM golang:1.17 AS builder

WORKDIR /go/src/app
COPY ./hello.go .

RUN go mod init

RUN go build -ldflags "-w"


FROM scratch
COPY --from=builder /go/src/app/app .
ENTRYPOINT ["./app"]