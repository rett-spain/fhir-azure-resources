terraform {
  required_providers {
    azurerm = {
      version = "= 3.44.1"
    }

  }

  backend "azurerm" {
    resource_group_name  = "FHIR-Terraform"
    storage_account_name = "fhirsta"
    container_name       = "tfstate"
    key                  = "terraform-develop.tfstate"
  }

}

provider "azurerm" {
  features {}
}



