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
  workspace_id                  = module.azurerm_healthcare_workspace.id
  kind                          = var.fhir_kind

#  authentication {
#    authority = "https://login.microsoftonline.com/tenantId"
#    audience  = "https://tfexfhir.fhir.azurehealthcareapis.com"
#  }
#
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
#  cors {
#    allowed_origins     = ["https://tfex.com:123", "https://tfex1.com:3389"]
#    allowed_headers     = ["*"]
#    allowed_methods     = ["GET", "DELETE", "PUT"]
#    max_age_in_seconds  = 3600
#    credentials_allowed = true
#  }
#
#  configuration_export_storage_account_name = "storage_account_name"
}