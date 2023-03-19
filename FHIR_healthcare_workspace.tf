locals {
  default_ahcw = {
    module_enabled               = local.enable_service_plan
    basename                     = local.basename
    location                     = local.location
    tags                         = local.tags
  }

  merged_ahcw = local.ahcws != null ? [for ahcw in local.ahcws : merge(local.default_ahcw, ahcw)] : []
}

module "healthcare_workspace" {
  source                       = "./modules/healthcare-workspace"
  for_each                     = local.merged_ahcw != null ? { for element in local.merged_ahcw : element.name => element } : {}
  module_enabled               = each.value.module_enabled
  basename                     = each.value.name
  resource_group_name          = module.resource_group[each.value.resource_group_name].name
  location                     = each.value.location
  tags                         = each.value.tags
}
