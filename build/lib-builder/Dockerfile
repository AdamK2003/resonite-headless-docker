FROM debian AS builder

WORKDIR /build

RUN apt-get -y update
RUN apt-get -y install git bc clang cmake autoconf make libtool libfreetype-dev bzip2 meson

COPY . .

RUN chmod a+x ./*
RUN ./run-builds.sh


FROM mcr.microsoft.com/dotnet/sdk:9.0 AS dotnet

WORKDIR /build

RUN apt-get -y update
RUN apt-get -y install git bc clang cmake autoconf make libtool libfreetype-dev bzip2 meson

COPY . .

RUN chmod a+x ./*
RUN ./run-dotnet-builds.sh


FROM alpine

RUN apk add rsync
RUN mkdir -p /libs /build

COPY --from=builder /build/output /build
COPY --from=dotnet /build/output /build

RUN chmod a+rx /build -R

CMD ["rsync", "-acL", "/build/", "/libs"]
