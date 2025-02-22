resource "newrelic_entity_tags" "dashboard_tags" {
  for_each = newrelic_one_dashboard.fgs_dashboard

  guid = each.value.guid

  tag {
    key    = "origin"
    values = ["terraform"]
  }
}

resource "newrelic_entity_tags" "workload_tag" {
  for_each = { for idx, w in newrelic_workload.workloads : idx => w }

  guid = each.value.guid

  tag {
    key    = "origin"
    values = ["terraform"]
  }
}
