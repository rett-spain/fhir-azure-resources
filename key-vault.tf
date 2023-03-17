module "key_vault" {
  source              = "github.com/Azure/azure-data-labs-modules/terraform/key-vault" #"../modules/key-vault"
  basename            = random_string.postfix.result
  resource_group_name = module.resource_group.name
  location            = var.location
  module_enabled      = 1
  is_sec_module       = 0
  #subnet_id            = module.local_snet_default.id
  #private_dns_zone_ids = [module.local_pdnsz_kv.list[local.dns_kv_vault].id]
  sku_name = var.sku_name
  tags     = {}
}
