locals {
  sources = read_terragrunt_config("sources.hcl")
  version = "main"
  resource_group  = "rg1"
  storage_account = "r1store1"
  container       = "container"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  features {}
}
EOF
}


remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "${local.resource_group}"
    storage_account_name = "${local.storage_account}"
    container_name       = "${local.container}"
    key                  = "${basename(get_terragrunt_dir())}/terraform.tfstate"
  }
}

terraform {
  source = "${local.sources.locals.terraform_project}?ref=${local.version}"
}

inputs = {
  resource_group_name = "${local.resource_group}"
  vnet = "prod"
}
