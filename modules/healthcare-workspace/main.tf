resource "azurerm_healthcare_workspace" "azure_health" {
  name                          = "ahcw-${var.basename}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  tags                          = var.tags

  count = var.module_enabled ? 1 : 0
}
