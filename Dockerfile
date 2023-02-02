FROM gcr.io/google.com/cloudsdktool/cloud-sdk:slim

RUN apt-get update && \
    apt-get install -y curl gnupg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
    apt-get update -y && \
    apt-get install google-cloud-sdk-gke-gcloud-auth-plugin -y && \
    apt-get -y install kubectl

RUN curl -LO \
    https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz \
    && \
    tar -zxvf helm-v3.1.2-linux-amd64.tar.gz \
    && \
    mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64 \
    && rm helm-*.tar.gz
