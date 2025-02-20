resource "newrelic_alert_policy" "golden_signal_policy" {
  for_each = data.newrelic_entity.application_entity

  name                = "Golden Signals - ${each.value.name}"
  incident_preference = "PER_CONDITION"
}
