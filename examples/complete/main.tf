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

  # Scrapers require an existing EKS cluster (or a VPC source). If no destination
  # is given, scraped metrics go to the workspace created by this module.
  # scrapers = {
  #   eks = {
  #     alias = "eks-scraper"
  #     source = {
  #       eks = {
  #         cluster_arn = "arn:aws:eks:us-east-1:123456789012:cluster/example"
  #         subnet_ids  = ["subnet-0123456789abcdef0"]
  #       }
  #     }
  #     scrape_configuration = <<-EOT
  #       global:
  #         scrape_interval: 30s
  #       scrape_configs:
  #         - job_name: kubernetes-pods
  #           kubernetes_sd_configs:
  #             - role: pod
  #     EOT
  #   }
  # }
}
