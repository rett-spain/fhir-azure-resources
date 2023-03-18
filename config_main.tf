terraform {
  required_providers {
    azurerm = {
      version = "= 3.44.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate17132"
    container_name       = "tfstate"
    key                  = "terraform-draft.tfstate"
  }
}

provider "azurerm" {
  features {}
}



