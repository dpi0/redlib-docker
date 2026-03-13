FROM rust:alpine AS builder

RUN apk add --no-cache git musl-dev gcc g++ make perl

WORKDIR /usr/src/app

RUN git clone "https://github.com/redlib-org/redlib.git" . && \
    git config user.email "docker@build.local" && \
    git config user.name "Docker Build" && \
    git fetch origin pull/506/head:pr506 && \
    git fetch origin pull/509/head:pr509 && \
    git checkout pr509 && \
    git merge pr506 && \
    cargo build --release

FROM alpine:3

RUN apk add --no-cache ca-certificates

RUN addgroup -S redlib && adduser -S redlib -G redlib

WORKDIR /home/redlib

COPY --from=builder /usr/src/app/target/release/redlib /usr/local/bin/redlib

USER redlib:redlib

EXPOSE 8080

CMD [ "redlib", "-a", "0.0.0.0", "-p", "8080" ]
