module "amp" {
  source = "../.."
  alias  = "test"

  create_alert_manager     = true
  alert_manager_definition = <<-EOT
  alertmanager_config: |
    route:
      receiver: 'default'
    receivers:
      - name: 'default'
  EOT
  rule_group_namespaces = {
    group = {
      name = "rule"
      data = <<-EOT
        groups:
          - name: test
            rules:
            - alert: PrometheusTargetMissing
               expr: up == 0
               for: 5m
        EOT
    }
  }
}
