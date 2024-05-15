terraform {
  required_providers {
    kustomization = {
      source  = "kbst/kustomization"
    }
  }
}

provider "kustomization" {
  kubeconfig_path = "${path.module}/.kubeconfig"
}

resource "time_static" "this" {}

resource "kustomization_resource" "secretstore" {
  manifest = jsonencode(yamldecode(templatefile("${path.module}/configmap.tpl.yaml", {
    time = time_static.this.id,
  })))
}
