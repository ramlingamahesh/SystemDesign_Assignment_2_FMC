terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.32.0"
    }

      }
  backend "azurerm" {}
}

provider "azurerm" {
   features {}
 }

data "azurerm_client_config" "current" {}

# Resource Group
resource "azurerm_resource_group" "dev_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Storage Account for  storing Terraform State file 

 resource "azurerm_storage_account" "bedrock_state_storage" {

  name                     =  var.bedrock_tfstate_storage
  resource_group_name      = azurerm_resource_group.dev_rg.name
  location                 = azurerm_resource_group.dev_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  public_network_access_enabled = false #Corrected attribute.

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_container" "bedrock_infra_state_container"{ 
  name                  = var.bedrock_infra_container_name
  storage_account_name  = azurerm_storage_account.dev_state_storage.name
  container_access_type = "private"
}

# Key Vault
resource "azurerm_key_vault" "bedrock_Kv_keyvault" {
  name                       = "${var.bedrock_infra_keyvault}-${random_integer.result}"
  location                   = azurerm_resource_group.dev_rg.location
  resource_group_name        = azurerm_resource_group.dev_rg.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  purge_protection_enabled   = var.keyvault_purge_protection_enabled
  soft_delete_retention_days = var.keyvault_soft_delete_retention_days
}

/* resource "azurerm_key_vault" "dev_keyvault" {
  // ... other configurations ...
  soft_delete_retention_days = var.keyvault_soft_delete_retention_days
  // ... other configurations ...
} */

/* # Azure DevOps Service Principal
resource "azuread_service_principal" "ado_sp" {
  display_name = var.ado_service_principal_name
}

resource "azuread_service_principal_password" "ado_sp_password" {
  service_principal_id = azuread_service_principal.ado_sp.id
  end_date_relative      = var.ado_service_principal_password_validity_hours
}

# Key Vault Access Policy for Azure DevOps Service Principal
resource "azurerm_key_vault_access_policy" "ado_sp_access" {
  key_vault_id = azurerm_key_vault.dev_keyvault.id
  tenant_id    = azuread_service_principal.ado_sp.tenant_id
  object_id    = azuread_service_principal.ado_sp.id
  secret_permissions = [
    "get",
    "list",
    "set",
    "delete",
  ] 
} */