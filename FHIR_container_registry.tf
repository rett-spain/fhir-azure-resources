
locals {
  default_acrs = {
    module_enabled                = local.enable_container_registry
    basename                      = local.basename
    location                      = var.location
    is_sec_module                 = false
    tags                          = {}
    is_private_endpoint           = false
    sku                           = "Premium"
    admin_enabled                 = false
    public_network_access_enabled = false
    private_dns_zone_ids          = []
    firewall_default_action       = "Allow"
    subnet_name                   = null
    vnet_name                     = null
  }

  merged_acr = local.acrs != null ? [for acr in local.acrs : merge(local.default_acrs, acr)] : []

}

module "container_registry" {
  source                        = "./modules/container-registry"
  for_each                      = local.merged_acr != null ? { for element in local.merged_acr : element.name => element } : {}
  module_enabled                = each.value.module_enabled
  basename                      = each.value.name
  resource_group_name           = module.resource_group[each.value.resource_group_name].name
  location                      = each.value.location
  tags                          = each.value.tags
  is_private_endpoint           = each.value.is_private_endpoint
  subnet_id                     = (each.value.vnet_name == null || each.value.subnet_name == null) && each.value.is_private_endpoint != "true" ? null : module.subnet[format("%s%s%s", each.value.vnet_name, "-", each.value.subnet_name)].id
  sku                           = each.value.sku
  admin_enabled                 = each.value.admin_enabled
  public_network_access_enabled = each.value.public_network_access_enabled
  private_dns_zone_ids          = each.value.private_dns_zone_ids
  firewall_default_action       = each.value.firewall_default_action
}

