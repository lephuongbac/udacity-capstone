DEPLOYMENT_NAME=udacity-capstone
DOCKER_IMAGE=registry.hub.docker.com/coderz/udacity-capstone:latest
REPLICAS=2

kubectl create deployment ${DEPLOYMENT_NAME} --image=${DOCKER_IMAGE} --replicas=${REPLICAS} &&
kubectl expose deployment/${DEPLOYMENT_NAME} --type="LoadBalancer" --port 3000