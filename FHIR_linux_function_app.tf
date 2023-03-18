# module "linux_function_app" {
#   source                     = 
#   basename                   = random_string.postfix.result
#   resource_group_name        = module.local_rg.name
#   location                   = var.location
#   storage_account_name       = module.local_storage_account.name
#   storage_account_access_key = module.local_storage_account.access_key
#   service_plan_id            = module.local_service_plan.id
#   tags                       = {}
# }
