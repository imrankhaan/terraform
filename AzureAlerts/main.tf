provider "azurerm" {
  features {}
}

variable "app_service_name" {
  type    = string
  default = "Appdemoalert"
}
variable "resource_group_name" {
  type    = string
  default = "rgwebapp"
}

variable "action_group_name" {
  type    = string
  default = "PlatformaActionGroup"
}

# Include other provider configurations and data sources if needed.
