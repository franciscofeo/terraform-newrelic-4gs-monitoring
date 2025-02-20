variable "newrelic_account_id" {
  type        = string
  description = "New Relic Account ID"
}

variable "newrelic_api_key" {
  type        = string
  description = "New Relic User API Key"
}

variable "newrelic_region" {
  type        = string
  description = "New Relic Region (Default: US)"
  default     = "US"
}

variable "newrelic_app_names" {
  type        = list(string)
  description = "List of application names (must be an exact match to your application name in New Relic )"
}
