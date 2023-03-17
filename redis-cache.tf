module "redis_cache" {
  source              = "../modules/redis-cache" // git::https://github.com/inditex/iac-azeventhub.git?ref=2.0.0"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  #subnet_id           = module.local_snet_default.id
  #private_dns_zone_ids = [module.local_pdnsz_redis.list[local.dns_redis].id]
  tags = {}
}
