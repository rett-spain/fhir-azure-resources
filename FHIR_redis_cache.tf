# module "redis_cache" {
#   source              = "https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/redis-cache?ref=v1.4.0"
#   basename            = random_string.postfix.result
#   resource_group_name = module.local_rg.name
#   location            = var.location
#   tags                = local.tags
# }
