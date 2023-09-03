
locals {
  default_stas = {
    module_enabled                      = local.enable_storage_account
    basename                            = local.basename
    location                            = var.location
    tags                                = {}
    is_sec_module                       = false
    subnet_name                         = null
    vnet_name                           = null
    private_dns_zone_ids_blob           = []
    private_dns_zone_ids_file           = []
    private_dns_zone_ids_dfs            = []
    hns_enabled                         = true
    firewall_default_action             = "Allow"
    firewall_ip_rules                   = []
    firewall_bypass                     = ["AzureServices"]
    firewall_virtual_network_subnet_ids = []


  }

  merged_sta = local.stas != null ? [for sta in local.stas : merge(local.default_stas, sta)] : []

}

module "storage_account" {
  source                              = "./modules/storage-account"
  for_each                            = local.merged_sta != null ? { for element in local.merged_sta : element.name => element } : {}
  module_enabled                      = each.value.module_enabled
  basename                            = each.value.name
  resource_group_name                 = module.resource_group[each.value.resource_group_name].name
  location                            = each.value.location
  tags                                = each.value.tags
  subnet_id                           = (each.value.vnet_name == null || each.value.subnet_name == null) && each.value.is_sec_module != "true" ? null : module.subnet[format("%s%s%s", each.value.vnet_name, "-", each.value.subnet_name)].id
  private_dns_zone_ids_blob           = each.value.private_dns_zone_ids_blob
  private_dns_zone_ids_file           = each.value.private_dns_zone_ids_file
  private_dns_zone_ids_dfs            = each.value.private_dns_zone_ids_dfs
  hns_enabled                         = each.value.hns_enabled
  firewall_default_action             = each.value.firewall_default_action
  firewall_ip_rules                   = each.value.firewall_ip_rules
  firewall_bypass                     = each.value.firewall_bypass
  firewall_virtual_network_subnet_ids = each.value.firewall_virtual_network_subnet_ids
  is_sec_module                       = each.value.is_sec_module
}
