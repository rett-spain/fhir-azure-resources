
# locals {
#   default_pdnsz = {
#     module_enabled = local.enable_private_dns_zone
#     tags           = {}
#     vnet_name      = null
#     dns_zones      = each.value.dns_zones
#   }

#   merged_pdnsz = local.pdnszs != null ? [for vnet in local.pdnszs : merge(local.default_pdnszs, pdnsz)] : []

# }

# module "private_dns_zone" {
#   source              = "./modules/private-dns-zone"
#   for_each            = local.merged_pdnsz != null ? { for element in local.merged_pdnsz : element.name => element } : {}
#   module_enabled      = each.value.module_enabled
#   basename            = each.value.name
#   resource_group_name = module.resource_group[each.value.resource_group_name].name
#   tags                = each.value.tags

# }
