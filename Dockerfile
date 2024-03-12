FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine

RUN apk --update add curl && \
    apk add kubectl && \
    gcloud components install gke-gcloud-auth-plugin && \
    rm -rf google-cloud-sdk/platform && \
    rm -rf google-cloud-sdk/bin/anthoscli && \
    rm -rf google-cloud-sdk/.install && \
    rm -rf google-cloud-sdk/data && \
    rm -rf usr/local/libexec && \
    rm -rf usr/local/bin/docker && \
    rm /var/cache/apk/*

RUN curl -LO \
    https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz \
    && \
    tar -zxvf helm-v3.1.2-linux-amd64.tar.gz \
    && \
    mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64 \
    && rm helm-*.tar.gz
