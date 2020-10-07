SHELL := /usr/bin/env bash

NDEF = $(if $(value $(1)),,$(error $(1) not set))

all: cfssl certs

.PHONY: cfssl certs

cfssl: 
	@./scripts/cfssl-install.sh

certs: 
	@ansible-playbook cfssl-generate.yaml --extra-vars "@cfssl.tfvars.json"

workercerts: 
	@ansible-playbook cfssl-worker.yaml --extra-vars "@cfssl.tfvars.json"

mastercerts: 
	@ansible-playbook cfssl-master.yaml --extra-vars "@cfssl.tfvars.json"

etcdcerts: 
	@ansible-playbook cfssl-etdc.yaml --extra-vars "@cfssl.tfvars.json"
