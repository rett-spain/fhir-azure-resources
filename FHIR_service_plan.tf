
locals {
  default_asp = {
    module_enabled               = local.enable_service_plan
    basename                     = local.basename
    location                     = local.location
    tags                         = local.tags
    os_type                      = "Linux"
    sku_name                     = "Y1"
    app_service_environment_id   = null
    maximum_elastic_worker_count = null
    worker_count                 = null
    per_site_scaling_enabled     = false
    zone_balancing_enabled       = false
  }

  merged_asp = local.asps != null ? [for asp in local.asps : merge(local.default_asp, asp)] : []

}

module "service_plan" {
  source                       = "./modules/service-plan"
  for_each                     = local.merged_asp != null ? { for element in local.merged_asp : element.name => element } : {}
  module_enabled               = each.value.module_enabled
  basename                     = each.value.name
  resource_group_name          = module.resource_group[each.value.resource_group_name].name
  location                     = each.value.location
  sku_name                     = each.value.sku_name
  tags                         = each.value.tags
  os_type                      = each.value.os_type
  app_service_environment_id   = each.value.app_service_environment_id
  maximum_elastic_worker_count = each.value.maximum_elastic_worker_count
  worker_count                 = each.value.worker_count
  per_site_scaling_enabled     = each.value.per_site_scaling_enabled
  zone_balancing_enabled       = each.value.zone_balancing_enabled
}
