# module "storage_account" {
#   source                  = "https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/storage-account?ref=v1.4.0"
#   basename                = random_string.postfix.result
#   resource_group_name     = module.local_rg.name
#   location                = var.location
#   subnet_id               = module.local_snet_default.id
#   hns_enabled             = true
#   firewall_default_action = var.firewall_default_action
#   firewall_bypass         = var.firewall_bypass
#   is_sec_module           = var.is_sec_module
#   tags                    = local.tags
# }
