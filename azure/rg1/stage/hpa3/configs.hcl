# Common inputs specific to namespace
inputs = {
  app_name = "${basename(get_terragrunt_dir())}"
  app_env  = "${basename(dirname(get_terragrunt_dir()))}"
  resource_group_name = "rg1"
  storage_account_name = "r1store1"
  container_name = "container"
}