provider "azurerm" {
    client_id       = "${var.azure_app_id}"
    client_secret   = "${var.azure_app_secret}"
    tenant_id       = "${var.azure_tenant_id}"
    subscription_id = "${var.azure_subscription_id}"
}

# Dev
module "cloud-red-weus2-dev" {
    source                     = "modules/cloud-red"
    environment_prefix         = "DEV"
    region_prefix              = "EUS2"
    app_insights_region_prefix = "EUS1"
    company_name               = "${var.company_name}"
    company_prefix             = "${var.company_prefix}"
    application_name           = "${var.application_name}"
    application_prefix         = "${var.application_prefix}"
    azure_app_id               = "${var.azure_app_id}"
    azure_app_secret           = "${var.azure_app_secret}"
    azure_tenant_id            = "${var.azure_tenant_id}"
    azure_subscription_id      = "${var.azure_subscription_id}"
}