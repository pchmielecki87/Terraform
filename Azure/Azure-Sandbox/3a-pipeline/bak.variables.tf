variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "terraform-techbrain-createdbypipeline"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "West Europe"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "terraform-appservice-plan"
}

variable "app_service_plan_sku_tier" {
  description = "Tier of the App Service Plan SKU"
  type        = string
  default     = "Free"
}

variable "app_service_plan_sku_size" {
  description = "Size of the App Service Plan SKU"
  type        = string
  default     = "F1"
}

variable "app_service_name" {
  description = "Name of the App Service"
  type        = string
  default     = "terraform-appservice"
}

variable "app_service_runtime" {
  description = "Runtime stack for the App Service (e.g., Python)"
  type        = string
  default     = "python|3.9"
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = "terraformstorageaccount"
}

variable "container_name" {
  description = "Name of the storage container"
  type        = string
  default     = "test-container"
}
