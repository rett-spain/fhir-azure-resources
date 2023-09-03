
locals {
  default_vnets = {
    module_enabled       = local.enable_virtual_network
    basename             = local.basename
    location             = var.location
    address_space        = ["192.168.0.0/24"]
    dns_servers          = []
    ddos_protection_plan = {}
    is_sec_module        = false
    tags                 = {}
  }

  merged_vnet = local.vnets != null ? [for vnet in local.vnets : merge(local.default_vnets, vnet)] : []

}

module "virtual_network" {
  source               = "./modules/virtual-network"
  for_each             = local.merged_vnet != null ? { for element in local.merged_vnet : element.name => element } : {}
  module_enabled       = each.value.module_enabled
  basename             = each.value.name
  resource_group_name  = module.resource_group[each.value.resource_group_name].name
  location             = each.value.location
  tags                 = each.value.tags
  address_space        = each.value.address_space
  dns_servers          = each.value.dns_servers
  ddos_protection_plan = each.value.ddos_protection_plan
}
