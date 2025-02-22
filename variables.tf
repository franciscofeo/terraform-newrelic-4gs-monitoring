variable "newrelic_account_id" {
  type        = string
  description = "New Relic Account ID."
}

variable "newrelic_api_key" {
  type        = string
  description = "New Relic User API Key."
}

variable "newrelic_region" {
  type        = string
  description = "New Relic Region (Default: US)."
  default     = "US"
}

variable "newrelic_app_names" {
  type        = list(string)
  description = "List of application names (must be an exact match to your application name in New Relic)."
}

variable "newrelic_dashboard_refresh_rate" {
  type        = number
  description = "This attribute determines the frequency for data refresh specified in milliseconds. See official New Relic Provider documentation to list all available values (Default: 60s)."
  default     = 60000
}

variable "newrelic_dashboard_permissions" {
  type        = string
  description = "Determines who can see the dashboard in an account (Default: public_read_write)."
  default     = "public_read_write"
}

variable "newrelic_create_workload" {
  type = bool
  description = "If 'true' a new workload will be created using the dashboards and entities. (Default: false)"
  default = false
}