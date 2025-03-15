output "resource_group_name" {
  value = azurerm_resource_group.dev_rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.dev_state_storage.name
}

output "storage_container_name" {
    value = azurerm_storage_container.dev_state_container.name
}

output "keyvault_name" {
    value = azurerm_key_vault.dev_keyvault.name
}

output "object_id" {
  value = data.azuread_client_config.current.object_id
}

/* output "service_principal_id" {
  value = azuread_service_principal.ado_sp.application_id
}

output "service_principal_password" {
  value     = azuread_service_principal_password.ado_sp_password
  sensitive = true
}

output "tenant_id" {
  value = data.azurerm_client_config.current.tenant_id
}

output "subscription_id" {
  value = data.azurerm_client_config.current.subscription_id
}
 */