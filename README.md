# Terraform Scripts to deploy FHIR services in Azure

This repository contains a library of [Terraform](https://registry.terraform.io/providers/hashicorp/azurerm/latest) scripts to create and maintain Azure resources required to implement solutions using the Fast Healthcare Interoperability Resources standard (aka [FIHR](https://www.hl7.org/fhir)).

It also contains GitHub actions to deploy (and delete) the resources in Azure.

We currently support the following resources:

* Resource Group
* Healthcare workspace with FHIR Service
* Key Vault
* Redis Cache
* Storage Account
* Application Insights

To use these scripts, you'll need an Azure subscription and the Terraform CLI installed on your machine. You'll also need to set the required variables for your environment.

Please refer to the config-fhir.yml file for a list of the required variables and their descriptions.