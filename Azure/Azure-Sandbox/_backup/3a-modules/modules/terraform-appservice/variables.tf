variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
  default = "rg-azure-app-service-terraformcreated"
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be provisioned"
  default = "eastus"
}

variable "app_service_plan_name" {
  type        = string
  description = "The Azure AppService Plan name"
  default = "app-service-plan-terraformcreated"
}

variable "app_service_name" {
  type        = string
  description = "The Azure AppService name"
  default = "app-service-terraformcreated"
}