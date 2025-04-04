provider "azurerm" {
  features {
  }
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

data "azurerm_client_config" "current" {}

resource "azurerm_service_plan" "appplan" {
    location = var.location
    name = var.service_plan_name
    os_type = var.os
    resource_group_name = azurerm_resource_group.rg.name
    sku_name = var.pricing_plan
}

resource "azurerm_linux_web_app" "serviceApp" {
  service_plan_id = azurerm_service_plan.appplan.id
  location = azurerm_service_plan.appplan.location
  name = var.linux_web_app_name
  resource_group_name = azurerm_resource_group.rg.name
  site_config {
            application_stack {
              dotnet_version = "8.0"
            }
            
         }
}

resource "azurerm_linux_web_app_slot" "deploySlot" {
  app_service_id = azurerm_linux_web_app.serviceApp.id
  name = var.linux_web_app_slot_name
  site_config {
  }
}
