variable "subscription_id" {
  description = "Subscription id of the account"
  type = string
  default = "c5803b2b-9f6c-4028-b835-cf4828eebaf8"
}

variable "location" {
    description = "location of service"
    type = string
    default = "eastus"
}

variable "resource_group_name" {
  description = "resource group name"
  type = string
  default = "rg-jenkins"
}

variable "os" {
  description = "Operating system"
  type = string
  default = "Linux"
}

variable "sku_name_plan" {
  description = "Pricing plan of the azure service plan"
  type = string
  default = "standard"
}

variable "app_service_name" {
  description = "name of the app service"
  type = string
  default = "webapijenkins505050123"
}
variable "service_plan_name" {
  description = "Name of the service plan"
  type = string
  default = "appserviceplantanishq"
}

variable "pricing_plan" {
  description = "Pricing plan of the azure service plan"
  type = string
  default = "S1"
}

variable "linux_web_app_name" {
  description = "name of the app service"
  type = string
  default = "linapptanishq"
}

variable "linux_web_app_slot_name" {
  description = "name of windows web app slot"
  type = string
  default = "linappslottanishq"
}