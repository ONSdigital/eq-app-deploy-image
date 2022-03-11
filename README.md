# EQ App Deploy Image
The Dockerfile used to build a base image for deploying EQ containers with Helm.

## Building
The image can be built using:

Image containing only the cloud-sdk library:

```sh
make build cloud-sdk
```

Image containing cloud-sdk, helm and k8s libraries:

```sh
make build k8s
```