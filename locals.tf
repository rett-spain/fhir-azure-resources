locals {
  tags = {
    Owner       = "FHIR Team"
    Project     = "FHIR Patient Registry"
    Environment = "dev"
    Toolkit     = "Terraform"
    Name        = "${var.prefix}"
  }

  safe_prefix  = replace(local.prefix, "-", "")
  safe_postfix = replace(local.postfix, "-", "")

  basename      = "${local.prefix}-${local.postfix}"
  safe_basename = "${local.safe_prefix}${local.safe_postfix}"

  # Update the config variable assignment to correctly decode the YAML file
  #config = yamldecode(file("${path.module}/../config-fhir.yml"))
  #config = yamldecode(file("${path.module}/config-fhir.yml"))
  # Hardcode the config variable with the values from the config-fhir.yml file
  config = {
    variables = {
      prefix   = "my-prefix"
      postfix  = "123"
      location = "northeurope"
    }
  }

  location = local.config.variables.location != null ? local.config.variables.location : var.location
  prefix   = local.config.variables.prefix != null ? local.config.variables.prefix : var.prefix
  postfix  = local.config.variables.postfix != null ? local.config.variables.postfix : var.postfix
}