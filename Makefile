build cloud-sdk:
	docker build -t eq-app-deploy-image:latest cloud-sdk/.

build k8s:
	docker build -t eq-app-deploy-image:latest k8s/.
