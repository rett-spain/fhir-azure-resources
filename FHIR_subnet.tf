
locals {
  default_subs = {
    module_enabled                                = local.enable_virtual_network
    tags                                          = {}
    vnet_name                                     = "example"
    name                                          = local.basename
    address_prefixes                              = ["192.168.0.0/25"]
    private_endpoint_network_policies_enabled     = false
    private_link_service_network_policies_enabled = false
    service_endpoints                             = []
    service_endpoint_policy_ids                   = []
    subnet_delegation                             = {}
    is_sec_module                                 = false

  }

  merged_sub = local.subs != null ? [for sub in local.subs : merge(local.default_subs, sub)] : []

}

module "subnet" {
  source                                        = "./modules/subnet"
  for_each                                      = local.merged_sub != null ? { for element in local.merged_sub : (format("%s%s%s", element.vnet_name, "-", element.name)) => element } : {}
  module_enabled                                = each.value.module_enabled
  resource_group_name                           = module.resource_group[each.value.resource_group_name].name
  vnet_name                                     = module.virtual_network[each.value.vnet_name].name
  name                                          = each.value.name
  tags                                          = each.value.tags
  address_prefixes                              = each.value.address_prefixes
  private_endpoint_network_policies_enabled     = each.value.private_endpoint_network_policies_enabled
  private_link_service_network_policies_enabled = each.value.private_link_service_network_policies_enabled
  service_endpoints                             = each.value.service_endpoints
  service_endpoint_policy_ids                   = each.value.service_endpoint_policy_ids
  subnet_delegation                             = each.value.subnet_delegation

}
