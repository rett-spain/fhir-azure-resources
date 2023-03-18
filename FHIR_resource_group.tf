# Resource group
locals {

  default_rg = {
    module_enabled = local.enable_resource_group
    location       = local.location
    tags           = local.tags

  }

  merged_rg = [for rg in local.rgs : merge(local.default_rg, rg)]

}

module "resource_group" {
  source         = "github.com/Azure/azure-data-labs-modules/terraform/resource-group"
  for_each       = { for element in local.merged_rg : element.name => element }
  module_enabled = each.value.module_enabled
  basename       = each.value.name
  location       = each.value.location
  tags           = each.value.tags
}
