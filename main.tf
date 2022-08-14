resource "aws_prometheus_workspace" "this" {
  count = var.create ? 1 : 0
  alias = var.alias
  tags  = var.tags
}