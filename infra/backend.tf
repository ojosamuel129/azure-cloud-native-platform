terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-uks-001"
    storage_account_name = "sttfstate1406828004"
    container_name       = "tfstate"
    key                  = "azure-cloud-native-platform.tfstate"
    use_azuread_auth     = true
  }
}
