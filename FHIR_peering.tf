
locals {
  default_peers = {
    module_enabled               = local.enable_subnet_peering
    basename                     = local.basename
    allow_virtual_network_access = true
    allow_forwarded_traffic      = false
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  merged_peer = local.peers != [] ? [for peer in local.peers : merge(local.default_peers, peer)] : []

}

module "virtual_network_peering" {
  source                       = "./modules/virtual-network-peering"
  for_each                     = local.merged_peer != null ? { for element in local.merged_peer : (format("%s%s%s", element.virtual_network_name, "-", element.name)) => element } : {}
  module_enabled               = each.value.module_enabled
  resource_group_name          = module.resource_group[each.value.resource_group_name].name
  basename                     = each.value.name
  virtual_network_name         = module.virtual_network[each.value.virtual_network_name].name
  remote_virtual_network_id    = module.virtual_network[each.value.remote_virtual_network_name].id
  allow_virtual_network_access = each.value.allow_virtual_network_access
  allow_gateway_transit        = each.value.allow_gateway_transit
  use_remote_gateways          = each.value.use_remote_gateways
}
