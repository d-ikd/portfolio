FROM node:12.5.0-alpine

WORKDIR /app

ENV LANG=C.UTF-8 \
    TZ=Asia/Tokyo

RUN apk update && \
    apk upgrade && \
    npm install -g n && \
    npm install -g create-nuxt-app && \
    yarn install &&\
    rm -rf /var/cache/apk/*

ADD . /app
