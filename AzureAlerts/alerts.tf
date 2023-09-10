

#Get the exiting web app 
data "azurerm_app_service" "appservice" {
  name = var.app_service_name
  resource_group_name = var.resource_group_name
}


# Metric Alert for HTTP 4xx Errors
resource "azurerm_monitor_metric_alert" "http_4xx_alert" {
  name                = "http-4xx-errors-alert"
  resource_group_name = var.resource_group_name
  scopes              = [data.azurerm_app_service.appservice.id]

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Http4xx"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 10
  }

  action {
    action_group_id = azurerm_monitor_action_group.PlatformActionGroup.id
  }
}

# Metric Alert for server Error
resource "azurerm_monitor_metric_alert" "Http_Server_Errors_alert" {
  name                = "Http_ServerErrors_alert"
  resource_group_name = var.resource_group_name
  scopes              = [data.azurerm_app_service.appservice.id]

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Http5xx"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 5
  }

  action {
    action_group_id = azurerm_monitor_action_group.PlatformActionGroup.id
  }
}

# Metric Alert for Response Time (The time taken for the app to serve requests, in seconds.)
resource "azurerm_monitor_metric_alert" "response_time_alert" {
  name                = "responsetime_alert"
  resource_group_name = var.resource_group_name
  scopes              = [data.azurerm_app_service.appservice.id]

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "HttpResponseTime"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 5
  }

  action {
    action_group_id = azurerm_monitor_action_group.PlatformActionGroup.id
  }
}


# Include other alert configurations if needed.
