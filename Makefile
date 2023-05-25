export SOME_ENV := someTest


all: versions terraforms

terraform:
	terraform -chdir=./InfrastructureAsCode/terraform init
	terraform -chdir=./InfrastructureAsCode/terraform apply

versions:
	aws --version
	aws sts get-caller-identity
	terraform --version
