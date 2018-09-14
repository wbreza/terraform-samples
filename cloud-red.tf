provider "azurerm" {
    client_id       = "${var.azure_app_id}"
    client_secret   = "${var.azure_app_secret}"
    tenant_id       = "${var.azure_tenant_id}"
    subscription_id = "${var.azure_subscription_id}"
}

resource "azurerm_resource_group" "resource_group" {
    name     = "${var.company_name}-${var.region_prefix}-${var.application_name}-${var.environment_prefix}"
    location = "${lookup(var.regions, var.region_prefix)}"

    tags {
        environment      = "${lookup(var.environments, var.environment_prefix)}"
        company_name     = "${var.company_name}"
        application_name = "${var.application_name}"
    }
}

resource "azurerm_application_insights" "app_insights" {
    name     = "${var.company_name}-${var.region_prefix}-${var.application_name}-appinsights-${var.environment_prefix}"
    resource_group_name         = "${azurerm_resource_group.resource_group.name}"
    location                    = "${lookup(var.regions, var.region_prefix)}2"
    application_type            = "Web"

    tags {
        environment      = "${lookup(var.environments, var.environment_prefix)}"
        company_name     = "${var.company_name}"
        application_name = "${var.application_name}"
    }
}

output "app_insights_instrumentation_key" {
  value = "${azurerm_application_insights.app_insights.instrumentation_key}"
}

output "app_insights_app_id" {
  value = "${azurerm_application_insights.app_insights.app_id}"
}

resource "azurerm_storage_account" "storage_account" {
    name = "${lower(var.company_prefix)}${lower(var.region_prefix)}${lower(var.application_prefix)}storage${lower(var.environment_prefix)}"
    resource_group_name         = "${azurerm_resource_group.resource_group.name}"
    location                    = "${lookup(var.regions, var.region_prefix)}"
    account_tier                = "Standard"
    account_replication_type    = "LRS"
    account_kind                = "StorageV2"

    tags {
        environment      = "${lookup(var.environments, var.environment_prefix)}"
        company_name     = "${var.company_name}"
        application_name = "${var.application_name}"
    }
}

resource "azurerm_app_service_plan" "app_service_plan" {
    name                = "${var.company_name}-${var.region_prefix}-${var.application_name}-appserviceplan-${var.environment_prefix}"
    location            = "${lookup(var.regions, var.region_prefix)}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"
    kind                = "Linux"

    sku {
        tier = "Standard"
        size = "S1"
    }

    tags {
        environment      = "${lookup(var.environments, var.environment_prefix)}"
        company_name     = "${var.company_name}"
        application_name = "${var.application_name}"
    }
}

resource "azurerm_container_registry" "container_registry" {
    name                = "${lower(var.company_name)}${lower(var.region_prefix)}${lower(var.application_name)}containerregistry${lower(var.environment_prefix)}"
    location            = "${lookup(var.regions, var.region_prefix)}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"
    sku                 = "Standard"

    tags {
        environment      = "${lookup(var.environments, var.environment_prefix)}"
        company_name     = "${var.company_name}"
        application_name = "${var.application_name}"
    }
}

resource "azurerm_function_app" "function_app" {
    name                      = "${var.company_name}-${var.region_prefix}-${var.application_name}-functions-${var.environment_prefix}"
    location                  = "${lookup(var.regions, var.region_prefix)}"
    resource_group_name       = "${azurerm_resource_group.resource_group.name}"
    app_service_plan_id       = "${azurerm_app_service_plan.app_service_plan.id}"
    storage_connection_string = "${azurerm_storage_account.storage_account.primary_connection_string}"
    version                   = "beta"
    https_only                = true

    app_settings = {
        app_insights_app_id              = "${azurerm_application_insights.app_insights.app_id}"
        app_insights_instrumentation_key = "${azurerm_application_insights.app_insights.instrumentation_key}"
    }

    tags {
        environment      = "${lookup(var.environments, var.environment_prefix)}"
        company_name     = "${var.company_name}"
        application_name = "${var.application_name}"
    }
}

resource "azurerm_cosmosdb_account" "cosmos" {
    name                      = "${lower(var.company_name)}-${lower(var.region_prefix)}-${lower(var.application_name)}-cosmos-${lower(var.environment_prefix)}"
    location                  = "${lookup(var.regions, var.region_prefix)}"
    resource_group_name       = "${azurerm_resource_group.resource_group.name}"
    offer_type                = "Standard"
    geo_location              = [{
        location = "${lookup(var.regions, var.region_prefix)}"
        failover_priority = 0
    }]

    consistency_policy        = {
        consistency_level       = "Eventual"
    }

    tags {
        environment      = "${lookup(var.environments, var.environment_prefix)}"
        company_name     = "${var.company_name}"
        application_name = "${var.application_name}"
    }
}