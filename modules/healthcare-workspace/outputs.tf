output "id" {
  value = (
    length(azurerm_healthcare_workspace.azure_health) > 0 ?
    azurerm_healthcare_workspace.azure_health[0].id : ""
  )
  description = "Resource identifier of the instance of Healthcare workspace."
}