# Changelog

All notable changes to this module will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- Raise `hashicorp/aws` provider constraint to `>= 6.66.0` (from `>= 3.74`).

### Added
- `kms_key_arn` input/output for `aws_prometheus_workspace` (customer-managed KMS key for workspace encryption, available since provider v6).
- `region` input, applied to all resources, for per-resource multi-region override (available since provider v6).
- Optional `tags` key support in `rule_group_namespaces` entries.
- `tags_all` output for the workspace.
- `rule_group_namespace_arns` output.

## [1.0.0] - 2022-08-14

### Added
- Add complete usage example.

## [0.2.0] - 2022-08-14

### Added
- Add Alert Manager support (`aws_prometheus_alert_manager_definition` and `aws_prometheus_rule_group_namespace` resources).

## [0.1.1] - 2022-08-14

### Changed
- Update README.

## [0.1.0] - 2022-08-14

Initial release.

[Unreleased]: https://github.com/tf-cloud-modules/terraform-aws-amp/compare/1.0.0...HEAD
[1.0.0]: https://github.com/tf-cloud-modules/terraform-aws-amp/compare/0.2.0...1.0.0
[0.2.0]: https://github.com/tf-cloud-modules/terraform-aws-amp/compare/0.1.1...0.2.0
[0.1.1]: https://github.com/tf-cloud-modules/terraform-aws-amp/compare/0.1.0...0.1.1
[0.1.0]: https://github.com/tf-cloud-modules/terraform-aws-amp/releases/tag/0.1.0
