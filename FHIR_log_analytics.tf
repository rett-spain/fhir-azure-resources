
locals {
  default_laws = {
    module_enabled             = local.enable_log_analytics
    basename                   = local.basename
    location                   = var.location
    tags                       = {}
    sku                        = "PerGB2018"
    retention_in_days          = 30
    daily_quota_gb             = -1
    internet_ingestion_enabled = false
    internet_query_enabled     = false
  }

  merged_law = local.laws != null ? [for law in local.laws : merge(local.default_laws, law)] : []

}

module "log_analytics_workspace" {
  source                     = "./modules/log-analytics/log-analytics-workspace"
  for_each                   = local.merged_law != null ? { for element in local.merged_law : element.name => element } : {}
  module_enabled             = each.value.module_enabled
  basename                   = each.value.name
  resource_group_name        = module.resource_group[each.value.resource_group_name].name
  location                   = each.value.location
  tags                       = each.value.tags
  sku                        = each.value.sku
  retention_in_days          = each.value.retention_in_days
  daily_quota_gb             = each.value.daily_quota_gb
  internet_ingestion_enabled = each.value.internet_ingestion_enabled
  internet_query_enabled     = each.value.internet_query_enabled
}
