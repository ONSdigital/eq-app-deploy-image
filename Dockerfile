FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine

RUN apk add && \
    apk add kubectl && \
    gcloud components install gke-gcloud-auth-plugin -q && \
    rm /var/cache/apk/*