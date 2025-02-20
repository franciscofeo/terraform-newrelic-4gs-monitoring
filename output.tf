output "guid_entities" {
  description = "GUID value from application_names input list."
  value = {
    for k, v in data.newrelic_entity.application_entity : k => v.guid
  }
}

output "alert_policies_created" {
  description = "Alert policies from created alerts."
  value = {
    for k, v in newrelic_alert_policy.golden_signal_policy : k => v
  }
}

output "alerts_created" {
  description = "Alerts created."
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
