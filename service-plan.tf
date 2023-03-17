module "service_plan" {
  source              = "../modules/service-plan"
  basename            = random_string.postfix.result
  resource_group_name = module.local_rg.name
  location            = var.location
  tags                = {}
}
