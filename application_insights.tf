module "application_insights" {
  source              = "../modules/application-insight"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  tags                = {}
}
