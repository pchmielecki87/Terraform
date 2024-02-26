variable "resource_group_name" {
  default     = ""
  # variable declared here without provided value
}

variable "location" {
  description = "The Azure region where resources will be provisioned"
  default     = "West Europe"
  # variable declared here with provided value
}

variable "storage_account_name" {
  description = "The name of the storage account"
  default     = ""
}

variable "contianer_storage_account_name" {
  description = "The name of the container in storage account"
  default     = ""
}

variable "app_service_plan_name" {
  description = "The Azure AppService Plan name"
  default     = ""
}

variable "app_service_name" {
  description = "The Azure AppService name"
  default     = ""
}