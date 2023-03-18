locals {
  default_aai = {
    module_enabled             = local.enable_keyvault
    sku_name                   = "standard"
    basename                   = local.basename
    location                   = local.location
    tags                       = local.tags
    application_type           = "web"
    internet_ingestion_enabled = false
    internet_query_enabled     = false
  }

  merged_aai = local.aais != null ? [for aai in local.aais : merge(local.default_aai, aai)] : []

}

module "application_insights" {
  source                     = "./modules/application-insights"
  for_each                   = local.merged_aai != null ? { for element in local.merged_aai : element.name => element } : {}
  module_enabled             = each.value.module_enabled
  basename                   = each.value.name
  resource_group_name        = module.resource_group[each.value.resource_group_name].name
  location                   = each.value.location
  tags                       = each.value.tags
  application_type           = each.value.application_type
  internet_ingestion_enabled = each.value.internet_ingestion_enabled
  internet_query_enabled     = each.value.internet_query_enabled
}
