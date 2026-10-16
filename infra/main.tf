terraform {
  required_version = ">= 1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "rg-tfdemo-uks-001"
  location = "uksouth"
  tags = {
    environment = "learning"
    owner       = "samuel"
  }
}
