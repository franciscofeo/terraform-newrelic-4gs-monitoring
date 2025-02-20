resource "newrelic_nrql_alert_condition" "response_time_alert" {
  for_each = newrelic_alert_policy.golden_signal_policy

  policy_id                    = each.value.id
  type                         = "static"
  name                         = "Response Time - ${each.value.name}"
  description                  = "High Transaction Response Time"
  runbook_url                  = "No runbook available"
  enabled                      = true
  violation_time_limit_seconds = 3600

  nrql {
    query = "SELECT filter(average(newrelic.timeslice.value), WHERE metricTimesliceName = 'HttpDispatcher') OR 0 FROM Metric WHERE appId IN (${data.newrelic_entity.application_entity[each.key].application_id}) AND metricTimesliceName IN ('HttpDispatcher', 'Agent/MetricsReported/count')"
  }

  critical {
    operator              = "above"
    threshold             = 5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "throughput_alert" {
  for_each = newrelic_alert_policy.golden_signal_policy

  policy_id                    = each.value.id
  type                         = "static"
  name                         = "Throughput - ${each.value.name}"
  description                  = "Low Throughput"
  runbook_url                  = "No runbook available"
  enabled                      = true
  violation_time_limit_seconds = 3600

  nrql {
    query = "SELECT count(newrelic.goldenmetrics.apm.application.throughput) FROM Metric where appId = ${data.newrelic_entity.application_entity[each.key].application_id}"
  }

  critical {
    operator              = "below"
    threshold             = 100
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "error_alert" {
  for_each = newrelic_alert_policy.golden_signal_policy

  policy_id                    = each.value.id
  type                         = "static"
  name                         = "Error - ${each.value.name}"
  description                  = "High Error Rate"
  runbook_url                  = "No runbook available"
  enabled                      = true
  violation_time_limit_seconds = 3600

  nrql {
    query = "SELECT count(*) FROM Transaction WHERE error = true AND appId = ${data.newrelic_entity.application_entity[each.key].application_id}"
  }

  critical {
    operator              = "above"
    threshold             = 1
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}

resource "newrelic_nrql_alert_condition" "high_cpu_alert" {
  for_each = newrelic_alert_policy.golden_signal_policy

  policy_id                    = each.value.id
  type                         = "static"
  name                         = "CPU Usage - ${each.value.name}"
  description                  = "High CPU Usage"
  runbook_url                  = "No runbook available"
  enabled                      = true
  violation_time_limit_seconds = 3600

  nrql {
    query = "SELECT average(cpuPercent) FROM SystemSample"
  }

  critical {
    operator              = "above"
    threshold             = 85
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}
