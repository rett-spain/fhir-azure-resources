module "key_vault" {
  source              = "../modules/key-vault"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  #subnet_id            = module.local_snet_default.id
  #private_dns_zone_ids = [module.local_pdnsz_kv.list[local.dns_kv_vault].id]
  sku_name = var.sku_name
  tags     = {}
}
