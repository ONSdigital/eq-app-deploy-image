FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine AS builder

RUN apk --update add curl && \
    apk add kubectl && \
    gcloud components install gke-gcloud-auth-plugin && \
    rm /var/cache/apk/*

RUN curl -LO \
    https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz \
    && \
    tar -zxvf helm-v3.1.2-linux-amd64.tar.gz \
    && \
    mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64 \
    && rm helm-*.tar.gz

FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine

COPY --from=builder google-cloud-sdk/bin/gke-gcloud-auth-plugin google-cloud-sdk/bin/gke-gcloud-auth-plugin
COPY --from=builder google-cloud-sdk/bin/gcloud google-cloud-sdk/bin/gcloud
COPY --from=builder /usr/local/bin/helm /usr/local/bin/helm
COPY --from=builder /usr/bin/kubectl /usr/bin/kubectl

