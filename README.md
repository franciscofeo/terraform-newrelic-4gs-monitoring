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
| [newrelic_nrql_alert_condition.error_alert](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |
| [newrelic_nrql_alert_condition.high_cpu_alert](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |
| [newrelic_nrql_alert_condition.response_time_alert](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |
| [newrelic_nrql_alert_condition.throughput_alert](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |
| [newrelic_entity.application_entity](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/data-sources/entity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_newrelic_account_id"></a> [newrelic\_account\_id](#input\_newrelic\_account\_id) | New Relic Account ID | `string` | n/a | yes |
| <a name="input_newrelic_api_key"></a> [newrelic\_api\_key](#input\_newrelic\_api\_key) | New Relic User API Key | `string` | n/a | yes |
| <a name="input_newrelic_app_names"></a> [newrelic\_app\_names](#input\_newrelic\_app\_names) | List of application names (must be an exact match to your application name in New Relic ) | `list(string)` | n/a | yes |
| <a name="input_newrelic_region"></a> [newrelic\_region](#input\_newrelic\_region) | New Relic Region (Default: US) | `string` | `"US"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alert_policies_created"></a> [alert\_policies\_created](#output\_alert\_policies\_created) | Alert policies from created alerts. |
| <a name="output_alerts_created"></a> [alerts\_created](#output\_alerts\_created) | Alerts created. |
| <a name="output_guid_entities"></a> [guid\_entities](#output\_guid\_entities) | GUID value from application\_names input list. |
<!-- END_TF_DOCS -->