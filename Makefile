init: check-vars
	rm -rf ./.terraform
	terraform init -backend=true -backend-config=./environments/${ENV}/backend.tfvars

check-vars: check-var-ENV

check-var-%:
	@ if [ "${${*}}" = "" ]; then echo "environment variable '$*' not set"; exit 1; fi

plan: init
	@echo "*******************************************"
	@echo "* ACTION:		PLAN"
	@echo "* ENV:			${ENV}"
	@echo "*******************************************"
	terraform plan --var-file=./environments/${ENV}/variables.tfvars

apply: init
	@echo "*******************************************"
	@echo "* ACTION:		APPLY"
	@echo "* ENV:			${ENV}"
	@echo "*******************************************"
	terraform apply --var-file=./environments/${ENV}/variables.tfvars

destroy: init
	@echo "*******************************************"
	@echo "* ACTION:		DESTROY"
	@echo "* ENV:			${ENV}"
	@echo "*******************************************"
	terraform destroy --var-file=./environments/${ENV}/variables.tfvars
