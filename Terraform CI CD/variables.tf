variable "resource_group_name" {
  description = "Name of the resource group for Dev environment"
  type        = string
  default     = "dev-rg"
  # default     = "rg-infra_layer-eu-001"
}

variable "location" {
  description = "Azure region for Dev environment"
  type        = string
  default     = "East US"
}

variable "bedrock_tfstate_storage" {
  description = "Prefix for the storage account name"
  type        = string
  default     = "bedrock_tfstate_storage"
}

variable "bedrock_infra_container_name" {
  description = "Name of the storage container for Terraform state"
  type        = string
  default     = "terraform-state"
}

variable "bedrock_infra_keyvault" {
  description = "Prefix for the key vault name"
  type        = string
  default     = "dev-keyvault"
}


variable "keyvault_soft_delete_retention_days" {
  description = "Soft delete retention days for the key vault"
  type        = number
  default     = 7
}

variable "keyvault_purge_protection_enabled" {
  description = "Enable purge protection on the key vault"
  type        = bool
  default     = false # Set to true in production
}


/* 
variable "ado_service_principal_name" {
  description = "Display name for the Azure DevOps service principal"
  type        = string
  default     = "ado-dev-sp"
}

variable "ado_service_principal_password_validity_hours" {
  description = "Validity of the Azure DevOps service principal password in hours"
  type        = string
  default     = "8760h" # 1 year
}

variable "keyvault_purge_protection_enabled" {
  description = "Enable purge protection on the key vault"
  type        = bool
  default     = false # Set to true in production
}

variable "keyvault_soft_delete_retention_days" {
  description = "Soft delete retention days for the key vault"
  type        = number
  default     = 7
} */