terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      version = "= 3.44.1"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "westeurope"
}