# Include all settings from the root backend-terragrunt.hcl file
include {
  path = find_in_parent_folders("backend-terragrunt.hcl")
}

locals {
  sources = read_terragrunt_config(find_in_parent_folders("sources.hcl"))
  version = "main"
}

terraform {
  source = "${local.sources.locals.terraform_cluster}?ref=${local.version}"
}

inputs = {
  app_name = "${basename(get_terragrunt_dir())}"
  app_env = "${basename(dirname(get_terragrunt_dir()))}"
  accessibility = {
    app_admins  = ["chakradhar.ghali@zopsmart.com"]
    app_editors = []
    app_viewers = []
  }
  resource_group_name  = "rg1"
  storage_account = "r1store1"
  app_private_subnets = ["default"]
  location       = "eastus"
  node_config = {
    required_cpu = 2
    required_memory = "8GB"
    min_count = 3
    max_count= 3
  }
}