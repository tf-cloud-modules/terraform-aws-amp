# AWS Managed Service for Prometheus (AMP) Terraform module

Terraform module which creates AWS Managed Service for Prometheus (AMP) resources.

```hcl
module "amp" {
  source  = "tf-cloud-modules/amp/aws"
  alias   = "test"

  create_alert_manager = true
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
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.74 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.26.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_prometheus_alert_manager_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/prometheus_alert_manager_definition) | resource |
| [aws_prometheus_rule_group_namespace.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/prometheus_rule_group_namespace) | resource |
| [aws_prometheus_workspace.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/prometheus_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_manager_definition"></a> [alert\_manager\_definition](#input\_alert\_manager\_definition) | The alert manager definition that you want to be applied. | `string` | `"alertmanager_config: |\n  route:\n    receiver: 'default'\n  receivers:\n    - name: 'default'\n"` | no |
| <a name="input_alias"></a> [alias](#input\_alias) | The alias of the prometheus workspace. | `any` | n/a | yes |
| <a name="input_create"></a> [create](#input\_create) | Controls if resources should be created. | `bool` | `true` | no |
| <a name="input_create_alert_manager"></a> [create\_alert\_manager](#input\_create\_alert\_manager) | Determines whether alert\_manager resources will be created. | `bool` | `false` | no |
| <a name="input_rule_group_namespaces"></a> [rule\_group\_namespaces](#input\_rule\_group\_namespaces) | A map of one or more rule group namespace definitions. | `map(any)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name (ARN) of the workspace |
| <a name="output_id"></a> [id](#output\_id) | Identifier of the workspace |
| <a name="output_prometheus_endpoint"></a> [prometheus\_endpoint](#output\_prometheus\_endpoint) | Prometheus endpoint for this workspace |
<!-- END_TF_DOCS -->