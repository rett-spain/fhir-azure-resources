locals {
  default_arc = {
    module_enabled                = local.enable_redis_cache
    basename                      = local.basename
    location                      = var.location
    subnet_id                     = ""
    private_dns_zone_ids          = []
    tags                          = local.tags
    capacity                      = 2
    family                        = "C"
    sku_name                      = "Standard"
    enable_non_ssl_port           = false
    public_network_access_enabled = false
    minimum_tls_version           = "1.2"
    is_sec_module                 = false
  }

  merged_arc = local.arcs != null ? [for arc in local.arcs : merge(local.default_arc, arc)] : []

}
module "redis_cache" {
  source                        = "./modules/redis-cache"
  for_each                      = local.merged_arc != null ? { for element in local.merged_arc : element.name => element } : {}
  module_enabled                = each.value.module_enabled
  basename                      = each.value.name
  resource_group_name           = module.resource_group[each.value.resource_group_name].name
  location                      = each.value.location
  subnet_id                     = each.value.subnet_id
  private_dns_zone_ids          = each.value.private_dns_zone_ids
  tags                          = each.value.tags
  is_sec_module                 = each.value.is_sec_module
  capacity                      = each.value.capacity
  family                        = each.value.family
  sku_name                      = each.value.sku_name
  enable_non_ssl_port           = each.value.enable_non_ssl_port
  public_network_access_enabled = each.value.public_network_access_enabled
  minimum_tls_version           = each.value.minimum_tls_version

}
