provider "azurerm" {
    client_id       = "${var.azure_app_id}"
    client_secret   = "${var.azure_app_secret}"
    tenant_id       = "${var.azure_tenant_id}"
    subscription_id = "${var.azure_subscription_id}"
}

# Test
module "cloud-red-wus1-test" {
    source                     = "modules/cloud-red"
    environment_prefix         = "TEST"
    region_prefix              = "WUS1"
    app_insights_region_prefix = "WUS2"
    company_name               = "${var.company_name}"
    company_prefix             = "${var.company_prefix}"
    application_name           = "${var.application_name}"
    application_prefix         = "${var.application_prefix}"
    azure_app_id               = "${var.azure_app_id}"
    azure_app_secret           = "${var.azure_app_secret}"
    azure_tenant_id            = "${var.azure_tenant_id}"
    azure_subscription_id      = "${var.azure_subscription_id}"
}