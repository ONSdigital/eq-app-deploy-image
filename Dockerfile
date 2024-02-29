FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine

RUN apk --update add curl && \
    apk add kubectl

RUN curl -LO \
    https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz \
    && \
    tar -zxvf helm-v3.1.2-linux-amd64.tar.gz \
    && \
    mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64 \
    && rm helm-*.tar.gz