SHELL := /usr/bin/env bash

NDEF = $(if $(value $(1)),,$(error $(1) not set))

all: cfssl certs

.PHONY: cfssl certs

cfssl: 
	@./scripts/cfssl-install.sh

certs: 
	@ansible-playbook cfssl-generate.yaml --extra-vars "@cfssl_vars.tf.json"