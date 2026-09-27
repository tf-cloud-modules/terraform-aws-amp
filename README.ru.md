[English](README.md) | **Русский**

# AWS Managed Service for Prometheus (AMP) Terraform module

Terraform-модуль, создающий ресурсы AWS Managed Service for Prometheus (AMP).

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
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.66.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.66.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_prometheus_alert_manager_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/prometheus_alert_manager_definition) | resource |
| [aws_prometheus_rule_group_namespace.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/prometheus_rule_group_namespace) | resource |
| [aws_prometheus_workspace.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/prometheus_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_alert_manager_definition"></a> [alert\_manager\_definition](#input\_alert\_manager\_definition) | The alert manager definition that you want to be applied. | `string` | `"alertmanager_config: |\n  route:\n    receiver: 'default'\n  receivers:\n    - name: 'default'\n"` | no |
| <a name="input_alias"></a> [alias](#input\_alias) | The alias of the prometheus workspace. | `any` | n/a | yes |
| <a name="input_create"></a> [create](#input\_create) | Controls if resources should be created. | `bool` | `true` | no |
| <a name="input_create_alert_manager"></a> [create\_alert\_manager](#input\_create\_alert\_manager) | Determines whether alert\_manager resources will be created. | `bool` | `false` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | The ARN of the KMS key to use for encrypting the workspace data. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where the resources will be managed. Defaults to the Region set in the provider configuration. | `string` | `null` | no |
| <a name="input_rule_group_namespaces"></a> [rule\_group\_namespaces](#input\_rule\_group\_namespaces) | A map of one or more rule group namespace definitions. Each object supports `name`, `data`, and an optional `tags` map. | `map(any)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name (ARN) of the workspace |
| <a name="output_id"></a> [id](#output\_id) | Identifier of the workspace |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | The ARN of the KMS key used for encrypting the workspace data. |
| <a name="output_prometheus_endpoint"></a> [prometheus\_endpoint](#output\_prometheus\_endpoint) | Prometheus endpoint for this workspace |
| <a name="output_rule_group_namespace_arns"></a> [rule\_group\_namespace\_arns](#output\_rule\_group\_namespace\_arns) | Map of ARNs of the rule group namespaces, keyed the same as var.rule\_group\_namespaces. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource. |
<!-- END_TF_DOCS -->
