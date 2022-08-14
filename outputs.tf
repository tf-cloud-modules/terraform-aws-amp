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