output "id" {
  value = (
    length(azurerm_healthcare_workspace.azure_health) > 0 ?
    azurerm_healthcare_workspace.azure_health[0].id : ""
  )
  description = "Resource identifier of the instance of Healthcare workspace."
}

output "fhir_id" {
  value = (
    length(azurerm_healthcare_fhir_service.azure_health) > 0 ?
    azurerm_healthcare_fhir_service.azure_health[0].id : ""
  )
  description = "Resource identifier of the instance of FHIR service."
}