# Action Group for Alert Notifications
resource "azurerm_monitor_action_group" "PlatformActionGroup" {
  name                = var.action_group_name
  resource_group_name = var.resource_group_name
  short_name = "PltActiongrp"

  email_receiver {
    name  = "Your reciver name"
    email_address  = "reciver email address"
  }
}

# Include other Action Group configurations if needed.
