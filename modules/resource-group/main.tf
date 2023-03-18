resource "azurerm_resource_group" "adl_rg" {
  name     = "rg-${var.basename}"
  location = var.location
  tags     = var.tags

  count = var.module_enabled ? 1 : 0
}
