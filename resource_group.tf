# Resource group

module "resource_group" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/resource-group"

  basename = local.basename
  location = local.location
  tags     = local.tags
}

# module "local_rg" {
#   source   = "../../resource-group"
#   basename = random_string.postfix.result
#   location = var.location
#   tags     = local.tags
# }

# module "local_rg" {
#   source   = "../../resource-group"
#   basename = random_string.postfix.result
#   location = var.location
#   tags     = local.tags
# }
