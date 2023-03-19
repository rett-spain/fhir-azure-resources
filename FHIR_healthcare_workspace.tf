locals {
  default_asp = {
    module_enabled               = local.enable_service_plan
    basename                     = local.basename
    location                     = local.location
    tags                         = local.tags
  }

  merged_asp = local.asps != null ? [for asp in local.asps : merge(local.default_asp, asp)] : []
}

module "healthcare_workspace" {
  source                       = "./modules/healthcare-workspace"
  for_each                     = local.merged_asp != null ? { for element in local.merged_asp : element.name => element } : {}
  module_enabled               = each.value.module_enabled
  basename                     = each.value.name
  resource_group_name          = module.resource_group[each.value.resource_group_name].name
  location                     = each.value.location
  tags                         = each.value.tags
}
