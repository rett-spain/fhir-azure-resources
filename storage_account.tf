module "storage_account" {
  source              = "../"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  subnet_id           = module.local_snet_default.id
  # private_dns_zone_ids_blob           = [module.local_pdnsz_st_blob.list[local.dns_st_blob].id]
  # private_dns_zone_ids_file           = [module.local_pdnsz_st_file.list[local.dns_st_file].id]
  # private_dns_zone_ids_dfs            = [module.local_pdnsz_st_dfs.list[local.dns_st_dfs].id]
  hns_enabled             = true
  firewall_default_action = var.firewall_default_action
  # firewall_ip_rules                   = [data.http.ip.response_body]
  firewall_bypass = var.firewall_bypass
  # firewall_virtual_network_subnet_ids = var.firewall_virtual_network_subnet_ids
  is_sec_module = var.is_sec_module
  tags          = {}
}
