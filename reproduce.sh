#!/usr/bin/env bash
k3d cluster create terraform-provider-kustomization
k3d kubeconfig print terraform-provider-kustomization > .kubeconfig
terraform init
terraform apply -auto-approve
terraform taint 'time_static.this'
terraform apply -auto-approve
k3d cluster delete terraform-provider-kustomization
