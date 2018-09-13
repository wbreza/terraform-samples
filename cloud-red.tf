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

resource "azurerm_storage_account" "storage_account" {
    name = "${lower(var.company_prefix)}${lower(var.region_prefix)}${lower(var.application_prefix)}storage${lower(var.environment_prefix)}"
    resource_group_name         = "${azurerm_resource_group.resource_group.name}"
    location                    = "${lookup(var.regions, var.region_prefix)}"
    account_tier                = "Standard"
    account_replication_type    = "LRS"
    account_kind                = "Storagev2"

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