locals {
  # Module source locations
  terraform_artifacts    = "git::git@github.com:zopsmart/z-infra//artifact/azure"
  terraform_project      = "git::git@github.com:zopsmart/z-infra//account-setup/azure"
  terraform_cluster      = "git::git@github.com:zopsmart/z-infra//k8s/azure/aks"
  terraform_namespace    = "git::git@github.com:zopsmart/z-infra//k8s/azure/namespace"
}