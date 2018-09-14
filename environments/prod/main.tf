provider "azurerm" {
    client_id       = "${var.azure_app_id}"
    client_secret   = "${var.azure_app_secret}"
    tenant_id       = "${var.azure_tenant_id}"
    subscription_id = "${var.azure_subscription_id}"
}

# Production
module "cloud-red-wus1-prod" {
    source                     = "modules/cloud-red"
    environment_prefix         = "PROD"
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

module "cloud-red-scus-prod" {
    source                     = "modules/cloud-red"
    environment_prefix         = "PROD"
    region_prefix              = "SCUS"
    app_insights_region_prefix = "SCUS"
    company_name               = "${var.company_name}"
    company_prefix             = "${var.company_prefix}"
    application_name           = "${var.application_name}"
    application_prefix         = "${var.application_prefix}"
    azure_app_id               = "${var.azure_app_id}"
    azure_app_secret           = "${var.azure_app_secret}"
    azure_tenant_id            = "${var.azure_tenant_id}"
    azure_subscription_id      = "${var.azure_subscription_id}"
}

module "cloud-red-eus1-prod" {
    source                     = "modules/cloud-red"
    environment_prefix         = "PROD"
    region_prefix              = "EUS1"
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