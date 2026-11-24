# Changelog

All notable changes to this module will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.0] - 2026-11-24

### Added
- `kms_key_arn` input/output for `aws_prometheus_workspace` (customer-managed KMS key for workspace encryption, supported by the provider since v5.32.0).
- `region` input, applied to all resources, for per-resource multi-region override (provider v6 feature).
- Optional `tags` key support in `rule_group_namespaces` entries.
- `tags_all` output for the workspace.
- `rule_group_namespace_arns` output.

### Changed
- **Breaking:** raise `hashicorp/aws` provider constraint to `>= 6.73.0` (from `>= 3.74`).

### Fixed
- Correct rule group namespace YAML indentation in the complete example and README usage snippets (AWS AMP rejected it with `ValidationException: Malformed rule group namespace`).

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

[Unreleased]: https://github.com/tf-cloud-modules/terraform-aws-amp/compare/2.0.0...HEAD
[2.0.0]: https://github.com/tf-cloud-modules/terraform-aws-amp/compare/1.0.0...2.0.0
[1.0.0]: https://github.com/tf-cloud-modules/terraform-aws-amp/compare/0.2.0...1.0.0
[0.2.0]: https://github.com/tf-cloud-modules/terraform-aws-amp/compare/0.1.1...0.2.0
[0.1.1]: https://github.com/tf-cloud-modules/terraform-aws-amp/compare/0.1.0...0.1.1
[0.1.0]: https://github.com/tf-cloud-modules/terraform-aws-amp/releases/tag/0.1.0
