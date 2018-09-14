# Terraform Azure Samples

# Workspaces
A workspace is available for each deployable environment target.  Each environment also has a seperate configuration with different scale unit configurations

## Prod
Represents a production environment with multiple scale units in different Azure regions
### Switch Environment
```bash
terraform workspace select prod
```

### Apply environment
```bash
terraform apply -var-file="{path_to_tfvars}" environments/prod
```
## Test
Repersents a test environment with 1 scale unit in a single region
### Switch Environment
```bash
terraform workspace select test
```

### Apply environment
```bash
terraform apply -var-file="{path_to_tfvars}" environments/test
```
## Dev
Represents a dev environment with 1 scale unit in a single region

### Switch Environment
```bash
terraform workspace select dev
```

### Apply environment
```bash
terraform apply -var-file="{path_to_tfvars}" environments/dev
```

# Modules
## Cloud Red
**Path:** `modules/cloud-red`

### Variables
`company_name` : The company name used as part of the resource naming convention

`company_prefix` : The company short name used as part of the resource naming convention

`application_name` : The application name used as part of the resource naming convention

`application_prefix` : The application short name used as part of the resource naming convention

`environment_prefix` : Short name for an environment used as part of the resource naming convention

`region_prefix` : Short name for the location/region used as part of the resource naming convention

`app_insights_region_prefix` : Short name for the location/region for an application insights resource

`azure_app_id` : The azure application id used to authenticate scan resources

`azure_app_secret` : The azure application secret used to authenticate and scan resources

`azure_tenant_id` : The source azure tenant id used as the target for resource scanning

`azure_subscription_id` : The azure subscription id used as the target for resource scanning