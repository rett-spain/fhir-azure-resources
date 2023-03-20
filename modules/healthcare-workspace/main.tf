data "azurerm_client_config" "current" {}

resource "azurerm_healthcare_workspace" "azure_health" {
  name                          = "ahcw${var.basename}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  tags                          = var.tags

  count = var.module_enabled ? 1 : 0
}

resource "azurerm_healthcare_fhir_service" "azure_health" {
  name                          = "ahfs${var.basename}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  workspace_id                  = azurerm_healthcare_workspace.azure_health[0].id
  kind                          = var.fhir_kind

  # Define the authentication for the FHIR service
  authentication {
    authority = "https://login.microsoftonline.com/${data.azurerm_client_config.current.tenant_id}"
    audience  = "https://${azurerm_healthcare_workspace.azure_health[0].name}-ahfs${var.basename}.fhir.azurehealthcareapis.com"
  }

#  access_policy_object_ids = [
#    data.azurerm_client_config.current.object_id
#  ]
#
#  identity {
#    type = "SystemAssigned"
#  }
#
#  container_registry_login_server_url = ["tfex-container_registry_login_server"]
#
  cors {
    allowed_origins     = ["*"]
    allowed_headers     = ["*"]
    allowed_methods     = ["DELETE", "GET", "OPTIONS", "PATCH"]
    max_age_in_seconds  = 600
    credentials_allowed = false
  }
#
#  configuration_export_storage_account_name = "storage_account_name"
}