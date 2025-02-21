resource "newrelic_one_dashboard" "fgs_dashboard" {
  for_each = toset(var.newrelic_app_names)

  name        = "[${each.value}] - 4 Golden Signals"
  permissions = var.newrelic_dashboard_permissions

  page {
    name = "[${each.value}] - 4 Golden Signals"

    widget_area {
      title  = "Response Time"
      row    = 1
      column = 1
      height = 3
      width  = 4

      refresh_rate = var.newrelic_dashboard_refresh_rate

      nrql_query {
        query = "FROM Transaction select average(duration) where transactionType = 'Web' WHERE appName = ${each.value} TIMESERIES "
      }

      facet_show_other_series = false
      legend_enabled          = true
      ignore_time_range       = false
      y_axis_left_min         = 0
      y_axis_left_max         = 0

      null_values {
        null_value = ""
      }

      units {
        unit = "ms"
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title  = "Throughput"
      row    = 1
      column = 5
      height = 3
      width  = 4

      refresh_rate = var.newrelic_dashboard_refresh_rate

      nrql_query {
        query = "FROM Transaction select count(*) where transactionType = 'Web' WHERE appName = ${each.value} TIMESERIES"
      }

      facet_show_other_series = false
      legend_enabled          = true
      ignore_time_range       = false
      y_axis_left_min         = 0
      y_axis_left_max         = 0
      y_axis_left_zero        = true
      is_label_visible        = true

      null_values {
        null_value = ""
      }

      units {
        unit = ""
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title  = "Errors %"
      row    = 1
      column = 9
      height = 3
      width  = 4

      refresh_rate = var.newrelic_dashboard_refresh_rate

      nrql_query {
        query = "FROM Transaction SELECT percentage(count(*), where error is not false) as 'Errors' WHERE transactionType = 'Web' AND appName = ${each.value} TIMESERIES"
      }

      facet_show_other_series = false
      legend_enabled          = true
      ignore_time_range       = false
      y_axis_left_min         = 0
      y_axis_left_max         = 0
      y_axis_left_zero        = true
      is_label_visible        = true

      null_values {
        null_value = ""
      }

      units {
        unit = "PERCENTAGE"
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title  = "Average CPU Usage"
      row    = 4
      column = 1
      height = 3
      width  = 4

      refresh_rate = var.newrelic_dashboard_refresh_rate

      nrql_query {
        query = "FROM SystemSample SELECT average(cpuPercent) TIMESERIES FACET hostname"
      }

      facet_show_other_series = false
      legend_enabled          = true
      ignore_time_range       = false
      y_axis_left_min         = 0
      y_axis_left_max         = 0
      y_axis_left_zero        = true
      is_label_visible        = true

      null_values {
        null_value = ""
      }

      units {
        unit = "PERCENTAGE"
      }

      colors {
        color = ""
      }
    }

    widget_line {
      title  = "Average Memory Usage"
      row    = 4
      column = 5
      height = 3
      width  = 4

      refresh_rate = var.newrelic_dashboard_refresh_rate

      nrql_query {
        query = "FROM SystemSample SELECT average(memoryUsedPercent) TIMESERIES FACET hostname"
      }

      facet_show_other_series = false
      legend_enabled          = true
      ignore_time_range       = false
      y_axis_left_min         = 0
      y_axis_left_max         = 0
      y_axis_left_zero        = true
      is_label_visible        = true

      null_values {
        null_value = ""
      }

      units {
        unit = "PERCENTAGE"
      }

      colors {
        color = ""
      }
    }
  }
}
