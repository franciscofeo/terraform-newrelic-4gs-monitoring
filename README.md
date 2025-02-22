# Terraform New Relic 4 Golden Signals

This module handles New Relic 4 Golden Signals alerts and dashboard creation and configuration.

## Compatability

This module is meant for use with Terraform 1.0+ and tested using Terraform 1.3+.
If you find incompatibilities using Terraform `>=1.0`, please open an issue.

## Usage

A simple usage is as follows:

```hcl
// This is the only configuration required

locals {
  newrelic_app_names = ["my-service-1", "my-service-2"]
}

module "4gs-monitoring" {
  source  = "franciscofeo/4gs-monitoring/newrelic"
  
  newrelic_app_names  = local.newrelic_app_names
  newrelic_account_id = var.newrelic_account_id
  newrelic_api_key    = var.newrelic_api_key
}
```

It's highly recommended to not set the `account_it` and `api_key` hard coded, to avoid security issues. Usually we can export these
variables, create a `.tfvars` file or send them while performing terraform commands.

To build your New Relic infrastructure just perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan -var="newrelic_account_id={ACCOUNT_ID}" -var="newrelic_api_key={API_KEY}"` to see the infrastructure plan
- `terraform apply -var="newrelic_account_id={ACCOUNT_ID}" -var="newrelic_api_key={API_KEY}"` to apply the infrastructure build
- `terraform destroy -var="newrelic_account_id={ACCOUNT_ID}" -var="newrelic_api_key={API_KEY}"` to destroy the built infrastructure

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0, < 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [newrelic_alert_policy.golden_signal_policy](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/alert_policy) | resource |
| [newrelic_entity_tags.dashboard_tags](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/entity_tags) | resource |
| [newrelic_entity_tags.workload_tag](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/entity_tags) | resource |
| [newrelic_nrql_alert_condition.error_alert](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |
| [newrelic_nrql_alert_condition.high_cpu_alert](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |
| [newrelic_nrql_alert_condition.response_time_alert](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |
| [newrelic_nrql_alert_condition.throughput_alert](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |
| [newrelic_one_dashboard.fgs_dashboard](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/one_dashboard) | resource |
| [newrelic_workload.workloads](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/workload) | resource |
| [newrelic_entity.application_entity](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/data-sources/entity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_newrelic_account_id"></a> [newrelic\_account\_id](#input\_newrelic\_account\_id) | New Relic Account ID. | `string` | n/a | yes |
| <a name="input_newrelic_api_key"></a> [newrelic\_api\_key](#input\_newrelic\_api\_key) | New Relic User API Key. | `string` | n/a | yes |
| <a name="input_newrelic_app_names"></a> [newrelic\_app\_names](#input\_newrelic\_app\_names) | List of application names (must be an exact match to your application name in New Relic). | `list(string)` | n/a | yes |
| <a name="input_newrelic_create_workload"></a> [newrelic\_create\_workload](#input\_newrelic\_create\_workload) | If 'true' a new workload will be created using the dashboards and entities. (Default: false) | `bool` | `false` | no |
| <a name="input_newrelic_dashboard_permissions"></a> [newrelic\_dashboard\_permissions](#input\_newrelic\_dashboard\_permissions) | Determines who can see the dashboard in an account (Default: public\_read\_write). | `string` | `"public_read_write"` | no |
| <a name="input_newrelic_dashboard_refresh_rate"></a> [newrelic\_dashboard\_refresh\_rate](#input\_newrelic\_dashboard\_refresh\_rate) | This attribute determines the frequency for data refresh specified in milliseconds. See official New Relic Provider documentation to list all available values (Default: 60s). | `number` | `60000` | no |
| <a name="input_newrelic_region"></a> [newrelic\_region](#input\_newrelic\_region) | New Relic Region (Default: US). | `string` | `"US"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alert_policies_created"></a> [alert\_policies\_created](#output\_alert\_policies\_created) | Alert Policies from created Alerts. |
| <a name="output_alerts_created"></a> [alerts\_created](#output\_alerts\_created) | Description from created Alerts. |
| <a name="output_dashboards_created"></a> [dashboards\_created](#output\_dashboards\_created) | GUID from created Dashboards |
| <a name="output_guid_entities"></a> [guid\_entities](#output\_guid\_entities) | GUID from application\_names input list. |
| <a name="output_workload_created"></a> [workload\_created](#output\_workload\_created) | GUID from created Workload. |
<!-- END_TF_DOCS -->