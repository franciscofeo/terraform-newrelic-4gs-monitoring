locals {
  dashboards_guids = [for d in newrelic_one_dashboard.fgs_dashboard : d.guid]
  entities_guids = [for e in data.newrelic_entity.application_entity : e.guid]
}

 /*
 Add a new workload only to group these 4 Golden Signals monitored applications
 could be a bit overengineering, so it's better to leave this resource be optional
 */
resource "newrelic_workload" "workloads" {
    count = var.newrelic_create_workload ? 1 : 0

    name = "4 Golden Signals Monitored Apps and Dashboards"
    account_id = var.newrelic_account_id

    entity_guids = concat(local.dashboards_guids, local.entities_guids)
}
