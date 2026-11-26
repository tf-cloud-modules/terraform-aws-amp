resource "aws_prometheus_workspace" "this" {
  count = var.create ? 1 : 0

  alias       = var.alias
  kms_key_arn = var.kms_key_arn
  region      = var.region
  tags        = var.tags
}

resource "aws_prometheus_alert_manager_definition" "this" {
  count = var.create && var.create_alert_manager ? 1 : 0

  workspace_id = aws_prometheus_workspace.this[0].id
  definition   = var.alert_manager_definition
  region       = var.region
}

resource "aws_prometheus_rule_group_namespace" "this" {
  for_each = var.create && var.create_alert_manager ? var.rule_group_namespaces : {}

  name         = each.value.name
  workspace_id = aws_prometheus_workspace.this[0].id
  data         = each.value.data
  region       = var.region
  tags         = lookup(each.value, "tags", {})
}

resource "aws_prometheus_scraper" "this" {
  for_each = { for k, v in var.scrapers : k => v if var.create }

  alias                = lookup(each.value, "alias", null)
  scrape_configuration = each.value.scrape_configuration
  region               = var.region
  tags                 = merge(var.tags, lookup(each.value, "tags", {}))

  source {
    dynamic "eks" {
      for_each = lookup(each.value.source, "eks", null) != null ? [each.value.source.eks] : []

      content {
        cluster_arn        = eks.value.cluster_arn
        subnet_ids         = eks.value.subnet_ids
        security_group_ids = lookup(eks.value, "security_group_ids", null)
      }
    }

    dynamic "vpc" {
      for_each = lookup(each.value.source, "vpc", null) != null ? [each.value.source.vpc] : []

      content {
        security_group_ids = vpc.value.security_group_ids
        subnet_ids         = vpc.value.subnet_ids
      }
    }
  }

  destination {
    dynamic "amp" {
      for_each = lookup(lookup(each.value, "destination", {}), "cloudwatch", null) == null ? [lookup(lookup(each.value, "destination", {}), "amp", {})] : []

      content {
        workspace_arn = lookup(amp.value, "workspace_arn", aws_prometheus_workspace.this[0].arn)
      }
    }

    dynamic "cloudwatch" {
      for_each = lookup(lookup(each.value, "destination", {}), "cloudwatch", null) != null ? [each.value.destination.cloudwatch] : []

      content {
        dataset_arn = cloudwatch.value.dataset_arn
      }
    }
  }

  dynamic "exporter" {
    for_each = lookup(each.value, "exporter", null) != null ? [each.value.exporter] : []

    content {
      dynamic "opensearch" {
        for_each = lookup(exporter.value, "opensearch", null) != null ? [exporter.value.opensearch] : []

        content {
          domain_arn = opensearch.value.domain_arn
        }
      }
    }
  }

  dynamic "role_configuration" {
    for_each = lookup(each.value, "role_configuration", null) != null ? [each.value.role_configuration] : []

    content {
      source_role_arn = lookup(role_configuration.value, "source_role_arn", null)
      target_role_arn = lookup(role_configuration.value, "target_role_arn", null)
    }
  }

  dynamic "timeouts" {
    for_each = lookup(each.value, "timeouts", null) != null ? [each.value.timeouts] : []

    content {
      create = lookup(timeouts.value, "create", null)
      update = lookup(timeouts.value, "update", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }
}
