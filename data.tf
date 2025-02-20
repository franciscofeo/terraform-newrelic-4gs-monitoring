data "newrelic_entity" "application_entity" {
  for_each = toset(var.newrelic_app_names)

  name   = each.value
  domain = "APM"
  type   = "APPLICATION"
}
