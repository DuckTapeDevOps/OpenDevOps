export SOME_ENV := someTest
service_name := ducktapedevops


all: versions terraforms

terraform:
	terraform -chdir=./InfrastructureAsCode/terraform init
	terraform -chdir=./InfrastructureAsCode/terraform apply

versions:
	aws --version
	aws sts get-caller-identity
	terraform --version

docker_build:
	docker build -f ./Dockerfiles/Fargate.Dockerfile -t $(service_name):latest .

docker_push:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 657979115245.dkr.ecr.us-east-1.amazonaws.com
	docker tag ducktapedevops:latest 657979115245.dkr.ecr.us-east-1.amazonaws.com/ducktapedevops:latest
	docker push 657979115245.dkr.ecr.us-east-1.amazonaws.com/ducktapedevops:latest

docker_run_locally:
	docker run -d --name ducktapedevops -p 8080:8080 ducktapedevops:latest
