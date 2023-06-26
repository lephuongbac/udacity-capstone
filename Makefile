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
	docker build -t udacity-capstone:1.0.0 .
create-eks-cluster:
	echo "Creating EKS cluster..."
	eksctl create cluster -f ./eks/cluster.yml
