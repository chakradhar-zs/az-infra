locals {
  account_vars   = read_terragrunt_config(find_in_parent_folders("accounts.hcl", "default.hcl"), {inputs = {}})
  namespace_vars = read_terragrunt_config(find_in_parent_folders("configs.hcl", "default.hcl"), {inputs = {}})
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

inputs =  merge(local.account_vars.inputs,local.namespace_vars.inputs)