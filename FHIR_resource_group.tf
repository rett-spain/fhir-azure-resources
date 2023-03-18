# Resource group


locals {
  rgs = {
    rg_01 = {
      module_enabled = local.enable_enable_resource_group
    }
  }

  default_rg = {
    module_enabled = false
    basename       = local.basename
    location       = local.location
    tags           = local.tags

  }

  merged_akv = [for rg in local.rgs : merge(local.default_rg, rg)]

}


module "resource_group" {
  source         = "https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/resource-group?ref=v1.4.0"
  for_each       = local.merged_akv
  module_enabled = local.enable_enable_resource_group
  basename       = local.basename
  location       = local.location
  tags           = local.tags
}
