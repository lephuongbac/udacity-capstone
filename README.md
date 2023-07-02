# Udacity capstone devops
## Introduction
Create a CI/CD pipeline for a microservices application for different deployment strategies

## Prerequisites
- NodeJS v14.x
- AWS client

## Installation

Install the dependencies eksctl, kubectl.

```sh
make setup
```

Install the backend dependencies.

```sh
make install
```

Build docker image.

```sh
make build-docker
```

Create EKS cluster.

```sh
make create-eks-cluster
```

Create EKS deployment.

```sh
make deploy
```

Rolling update.

```sh
make rolling-update
```

For production environments...

```sh
npm install --production
NODE_ENV=production node app
```

