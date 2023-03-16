# fhir-azure-resources
Terraform scripts to create and maintain FHIR Azure resources

## Pre-requisites

1. Terraform state

    Follow this steps to setup Terraform state: https://github.com/MicrosoftDocs/azure-dev-docs/blob/main/articles/terraform/store-state-in-azure-storage.md

    Include the backend "azurerm" info in main.tf.

        backend "azurerm" {
        resource_group_name  = "tfstate"
        storage_account_name = "<storage_account_name>"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
        }