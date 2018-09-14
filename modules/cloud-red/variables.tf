variable company_name {
    description = "The company name used as part of the resource naming convention"
}

variable company_prefix {
    description = "The company short name used as part of the resource naming convention"
}

variable application_name {
    description = "The application name used as part of the resource naming convention"
}

variable application_prefix {
    description = "The application short name used as part of the resource naming convention"
}

variable environment_prefix {
    description = "Short name for an environment used as part of the resource naming convention"
    default = "PROD"
}

variable region_prefix {
    description = "Short name for the location/region used as part of the resource naming convention"
    default = "WUS1"
}

variable app_insights_region_prefix {
    description = "Short name for the location/region for an application insights resource"
    default = "WUS1"
}

variable "azure_app_id" {
    description = "The azure application id used to authenticate scan resources"
}

variable "azure_app_secret" {
    description = "The azure application secret used to authenticate and scan resources"
}

variable "azure_tenant_id" {
    description = "The source azure tenant id used as the target for resource scanning"
}

variable "azure_subscription_id" {
    description = "The azure subscription id used as the target for resource scanning"
}

variable "regions" {
    description = "A map from region abbreviation to valid azure region names"
    type = "map"
    default = {
        "EUS1" = "eastus"
        "EUS2" = "eastus2"
        "WUS1" = "westus"
        "WUS2" = "westus2"
        "SCUS" = "southcentralus"
        "NCUS" = "northcentralus"
    }
}

variable "environments" {
    description = "A map from environment abbreviation to valid environment name"
    type = "map"
    default = {
        "DEV" = "Development"
        "TEST" = "Test"
        "PROD" = "Production"
    }
}