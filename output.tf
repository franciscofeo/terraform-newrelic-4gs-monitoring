output "guid_entities" {
  description = "GUID from application_names input list."
  value = {
    for k, v in data.newrelic_entity.application_entity : k => v.guid
  }
}

output "alert_policies_created" {
  description = "Alert Policies from created Alerts."
  value = {
    for k, v in newrelic_alert_policy.golden_signal_policy : k => v
  }
}

output "alerts_created" {
  description = "Description from Alerts created."
  value = [
    {
      for k, v in newrelic_nrql_alert_condition.response_time_alert : k => v.description
    },
    {
      for k, v in newrelic_nrql_alert_condition.throughput_alert : k => v.description
    },
    {
      for k, v in newrelic_nrql_alert_condition.error_alert : k => v.description
    },
    {
      for k, v in newrelic_nrql_alert_condition.high_cpu_alert : k => v.description
    }
  ]
}

output "dashboards_created" {
  description = "GUID from Dashboards created"
  value = {
    for k, v in newrelic_one_dashboard.fgs_dashboard : k => v.guid
  }
}
