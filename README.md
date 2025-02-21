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
| [newrelic_nrql_alert_condition.error_alert](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |
| [newrelic_nrql_alert_condition.high_cpu_alert](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |
| [newrelic_nrql_alert_condition.response_time_alert](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |
| [newrelic_nrql_alert_condition.throughput_alert](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |
| [newrelic_one_dashboard.fgs_dashboard](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/one_dashboard) | resource |
| [newrelic_entity.application_entity](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/data-sources/entity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_newrelic_account_id"></a> [newrelic\_account\_id](#input\_newrelic\_account\_id) | New Relic Account ID. | `string` | n/a | yes |
| <a name="input_newrelic_api_key"></a> [newrelic\_api\_key](#input\_newrelic\_api\_key) | New Relic User API Key. | `string` | n/a | yes |
| <a name="input_newrelic_app_names"></a> [newrelic\_app\_names](#input\_newrelic\_app\_names) | List of application names (must be an exact match to your application name in New Relic). | `list(string)` | n/a | yes |
| <a name="input_newrelic_dashboard_permissions"></a> [newrelic\_dashboard\_permissions](#input\_newrelic\_dashboard\_permissions) | Determines who can see the dashboard in an account (Default: public\_read\_write). | `string` | `"public_read_write"` | no |
| <a name="input_newrelic_dashboard_refresh_rate"></a> [newrelic\_dashboard\_refresh\_rate](#input\_newrelic\_dashboard\_refresh\_rate) | This attribute determines the frequency for data refresh specified in milliseconds. See official New Relic Provider documentation to list all available values (Default: 60s). | `number` | `60000` | no |
| <a name="input_newrelic_region"></a> [newrelic\_region](#input\_newrelic\_region) | New Relic Region (Default: US). | `string` | `"US"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alert_policies_created"></a> [alert\_policies\_created](#output\_alert\_policies\_created) | Alert policies from created alerts. |
| <a name="output_alerts_created"></a> [alerts\_created](#output\_alerts\_created) | Description from Alerts created. |
| <a name="output_dashboards_created"></a> [dashboards\_created](#output\_dashboards\_created) | GUID from Dashboards created |
| <a name="output_guid_entities"></a> [guid\_entities](#output\_guid\_entities) | GUID from application\_names input list. |
<!-- END_TF_DOCS -->