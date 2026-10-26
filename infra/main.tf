locals {
  tags = {
    environment = var.environment
    project     = "azure-cloud-native-platform"
    owner       = "samuel"
  }
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project}-${var.environment}-uks-001"
  location = var.location
  tags     = local.tags
}
