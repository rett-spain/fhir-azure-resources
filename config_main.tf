terraform {
  required_providers {
    azurerm = {
      version = "= 3.70.0"
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
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}



