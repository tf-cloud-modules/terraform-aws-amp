variable "create" {
  description = "Controls if resources should be created."
  type        = bool
  default     = true
}

variable "alias" {
  description = "The alias of the prometheus workspace."
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "create_alert_manager" {
  description = "Determines whether alert_manager resources will be created."
  type        = bool
  default     = false
}

variable "alert_manager_definition" {
  description = "The alert manager definition that you want to be applied."
  type        = string
  default     = <<-EOT
    alertmanager_config: |
      route:
        receiver: 'default'
      receivers:
        - name: 'default'
  EOT
}

variable "rule_group_namespaces" {
  description = "A map of one or more rule group namespace definitions."
  type        = map(any)
  default     = {}
}