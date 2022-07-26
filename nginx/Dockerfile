FROM nginx:stable-alpine

RUN sed -i 's/https/http/' /etc/apk/repositories

ARG WORKING_DIR

RUN mkdir -p $WORKING_DIR

RUN apk add --no-cache --update \
    curl \
    wget \
    git