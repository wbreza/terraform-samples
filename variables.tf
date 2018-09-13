variable company_name {}
variable company_prefix {}
variable application_name {}
variable application_prefix {}

variable environment_prefix {
    default = "PROD"
}

variable region_prefix {
    default = "WUS1"
}

variable "azure_app_id" {}

variable "azure_app_secret" {}

variable "azure_tenant_id" {}

variable "azure_subscription_id" {}

variable "regions" {
    type = "map"
    default = {
        "EUS1" = "eastus"
        "EUS2" = "eastus2"
        "WUS1" = "westus"
        "WUS2" = "westus2"
    }
}

variable "environments" {
    default = {
        "DEV" = "Development"
        "TEST" = "Test"
        "PROD" = "Production"
    }
}