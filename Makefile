DEPLOYMENT_NAME=udacity-capstone
DOCKER_IMAGE=registry.hub.docker.com/coderz/udacity-capstone:latest

setup:
	echo "Installing eksctl"
	./bin/install_eksctl.sh

	echo "Installing kubectl"
	./bin/install_kubectl.sh
install:
	echo "Installing..."
	npm install --prefix ./backend
lint:
	echo "Linting..."
	npm run lint --prefix ./backend
test:
	echo "Testing..."
	npm run test --prefix ./backend
build-docker:
	echo "Building docker image..."
	docker build -t udacity-capstone:latest .
create-eks-cluster:
	echo "Creating EKS cluster..."
	eksctl create cluster -f ./eks/cluster.yml
deploy:
	./bin/deploy.sh
rolling-update:
	kubectl get deployments -o wide
	kubectl set image deployments/${DEPLOYMENT_NAME} \
		${DEPLOYMENT_NAME}=${DOCKER_IMAGE}
	echo
	kubectl get all
rollback:
	kubectl get deployments -o wide
	kubectl rollout undo deployment ${DEPLOYMENT_NAME}
	kubectl describe pods | grep -i image
	echo
	kubectl get all
