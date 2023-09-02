locals {
  # Load the config-fhir.yml file into a variable
  config = yamldecode(file("${path.module}/config-fhir.yml"))

  # Tags for all resources
  tags = {
    Owner       = local.config.variables.owner != null ? local.config.variables.owner : var.owner
    Project     = local.config.variables.project != null ? local.config.variables.project : var.project
    Environment = local.config.variables.environment != null ? local.config.variables.environment : var.environment
    Toolkit     = local.config.variables.toolkit != null ? local.config.variables.toolkit : var.toolkit
    Name        = "${var.prefix}"
  }
  # Variables for all resources
  safe_prefix   = replace(local.prefix, "-", "")
  safe_postfix  = replace(local.postfix, "-", "")
  basename      = "${local.prefix}-${local.postfix}"
  safe_basename = "${local.safe_prefix}${local.safe_postfix}"

  # Location, prefix and postfix for the resources
  location = local.config.variables.location != null ? local.config.variables.location : var.location
  prefix   = local.config.variables.prefix != null ? local.config.variables.prefix : var.prefix
  postfix  = local.config.variables.postfix != null ? local.config.variables.postfix : var.postfix

  # Feature Flags
  enable_resource_group      = local.config.variables.enable_resource_group != null ? local.config.variables.enable_resource_group : var.enable_resource_group
  enable_keyvault            = local.config.variables.enable_keyvault != null ? local.config.variables.enable_keyvault : var.enable_keyvault
  enable_storage_account     = local.config.variables.enable_storage_account != null ? local.config.variables.enable_storage_account : var.enable_storage_account
  enable_redis_cache         = local.config.variables.enable_redis_cache != null ? local.config.variables.enable_redis_cache : var.enable_redis_cache
  enable_application_insight = local.config.variables.enable_application_insight != null ? local.config.variables.enable_application_insight : var.enable_application_insight
  enable_service_plan        = local.config.variables.enable_service_plan != null ? local.config.variables.enable_service_plan : var.enable_service_plan
  enable_virtual_network     = local.config.variables.enable_virtual_network != null ? local.config.variables.enable_virtual_network : var.enable_virtual_network
  enable_subnet              = local.config.variables.enable_subnet != null ? local.config.variables.enable_subnet : var.enable_subnet
  enable_subnet_peering      = local.config.variables.enable_subnet_peering != null ? local.config.variables.enable_subnet_peering : var.enable_subnet_peering
  enable_container_registry  = local.config.variables.enable_container_registry != null ? local.config.variables.enable_container_registry : var.enable_container_registry
  # enable_function_app  = local.config.variables.enable_function_app != null ? local.config.variables.function_app : var.function_app
  # enable_log_analytics = local.config.variables.enable_log_analytics != null ? local.config.variables.log_analytics : var.enable_log_analytics

  # List of Resources.
  rgs   = local.config.variables.rg_resource != null ? local.config.variables.rg_resource : []
  akvs  = local.config.variables.akv_resource != null ? local.config.variables.akv_resource : []
  stas  = local.config.variables.sta_resource != null ? local.config.variables.sta_resource : []
  arcs  = local.config.variables.arc_resource != null ? local.config.variables.arc_resource : []
  aais  = local.config.variables.aai_resource != null ? local.config.variables.aai_resource : []
  asps  = local.config.variables.asp_resource != null ? local.config.variables.asp_resource : []
  vnets = local.config.variables.vnet_resource != null ? local.config.variables.vnet_resource : []
  subs  = local.config.variables.sub_resource != null ? local.config.variables.sub_resource : []
  peers = local.config.variables.subnet_peering_resource != null ? local.config.variables.subnet_peering_resource : []
  acrs  = local.config.variables.acr_resource != null ? local.config.variables.acr_resource : []
}
