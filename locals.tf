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

  safe_prefix  = replace(local.prefix, "-", "")
  safe_postfix = replace(local.postfix, "-", "")

  basename      = "${local.prefix}-${local.postfix}"
  safe_basename = "${local.safe_prefix}${local.safe_postfix}"

  # Location, prefix and postfix for the resources
  location = local.config.variables.location != null ? local.config.variables.location : var.location
  prefix   = local.config.variables.prefix != null ? local.config.variables.prefix : var.prefix
  postfix  = local.config.variables.postfix != null ? local.config.variables.postfix : var.postfix
}
