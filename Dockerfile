FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine AS builder

# Install gcloud auth plugin, kubectl and helm
RUN apk --update --no-cache add curl && \
    gcloud components install gke-gcloud-auth-plugin kubectl && \
    curl -LO https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz && \
    tar -zxvf helm-v3.1.2-linux-amd64.tar.gz

FROM alpine:3.19

# Add gcloud to the path
ENV PATH /google-cloud-sdk/bin:$PATH

# Install dependencies
RUN apk add --no-cache python3 bash jq

# Copy binaries from the builder
COPY --from=builder google-cloud-sdk/lib /google-cloud-sdk/lib
COPY --from=builder google-cloud-sdk/bin/gke-gcloud-auth-plugin google-cloud-sdk/bin/gke-gcloud-auth-plugin
COPY --from=builder google-cloud-sdk/bin/gcloud google-cloud-sdk/bin/gcloud
COPY --from=builder google-cloud-sdk/bin/kubectl google-cloud-sdk/bin/kubectl
COPY --from=builder linux-amd64/helm /usr/local/bin/helm

# Update gcloud config
RUN gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image

# Set the default configuration directory
VOLUME ["/root/.config"]