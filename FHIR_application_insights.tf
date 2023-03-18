# module "application_insights" {
#   source              = "../modules/application-insight"
#   module_enabled      = local.enable_application_insights
#   basename            = random_string.postfix.result
#   resource_group_name = module.local_rg.name
#   location            = var.location
#   tags                = local.tags
# }
