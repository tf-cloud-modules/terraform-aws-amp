output "arn" {
  description = "Amazon Resource Name (ARN) of the workspace"
  value       = try(aws_prometheus_workspace.this[0].arn, "")
}

output "id" {
  description = "Identifier of the workspace"
  value       = try(aws_prometheus_workspace.this[0].id, "")
}

output "prometheus_endpoint" {
  description = "Prometheus endpoint for this workspace"
  value       = try(aws_prometheus_workspace.this[0].prometheus_endpoint, "")
}

output "kms_key_arn" {
  description = "The ARN of the KMS key used for encrypting the workspace data."
  value       = try(aws_prometheus_workspace.this[0].kms_key_arn, "")
}

output "tags_all" {
  description = "A map of tags assigned to the resource."
  value       = try(aws_prometheus_workspace.this[0].tags_all, "")
}

output "rule_group_namespace_arns" {
  description = "Map of ARNs of the rule group namespaces, keyed the same as var.rule_group_namespaces."
  value       = { for k, v in aws_prometheus_rule_group_namespace.this : k => try(v.arn, "") }
}