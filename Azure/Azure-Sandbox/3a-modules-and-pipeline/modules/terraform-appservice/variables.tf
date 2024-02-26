variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}

variable "location" {
  type = string
  description = "The Azure region where resources will be provisioned"
}

variable "app_service_plan_name" {
  type = string
  description = "The Azure AppService Plan name"
}

variable "app_service_name" {
  type = string
  description = "The Azure AppService name"
}