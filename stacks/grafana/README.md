# Grafana

Authentication to this service *requires* one of the following:

1. AWS IAM Identity Center
1. SAML

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.37.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_managed_grafana"></a> [managed\_grafana](#module\_managed\_grafana) | terraform-aws-modules/managed-service-grafana/aws | ~>2.1 |

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.grafana_workspace_api_keys](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.grafana_workspace_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_ssm_parameter.node_security_group_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | EKS cluster name the workspace is deployed for. | `string` | n/a | yes |
| <a name="input_grafana_workspace_name"></a> [grafana\_workspace\_name](#input\_grafana\_workspace\_name) | Grafana workspace name. | `string` | n/a | yes |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | List of VPC subnets used for the cluster subnet group | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region being deployed to. | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Cluster VPC Security groups for Grafana access | `list(string)` | n/a | yes |
| <a name="input_enable_alerts"></a> [enable\_alerts](#input\_enable\_alerts) | Determines whether IAM permissions for alerting are enabled for the workspace IAM role | `bool` | `true` | no |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Map of key,value pairs to tag all resources. | `map(string)` | `{}` | no |
| <a name="input_grafana_admin_groups"></a> [grafana\_admin\_groups](#input\_grafana\_admin\_groups) | List of AWS SSO groups to assign as administrators in Amazon Managed Grafana.. | `list(string)` | `[]` | no |
| <a name="input_grafana_editor_groups"></a> [grafana\_editor\_groups](#input\_grafana\_editor\_groups) | List of AWS SSO groups to assign as editor in Amazon Managed Grafana. | `list(string)` | `[]` | no |
| <a name="input_grafana_readonly_groups"></a> [grafana\_readonly\_groups](#input\_grafana\_readonly\_groups) | List of AWS SSO groups to assign as readonly users in Amazon Managed Grafana. | `list(string)` | `[]` | no |
| <a name="input_grafana_version"></a> [grafana\_version](#input\_grafana\_version) | Grafana version to deploy. | `string` | `"9.4"` | no |
| <a name="input_terraform_execution_role"></a> [terraform\_execution\_role](#input\_terraform\_execution\_role) | Role ARN to assume for Terraform execution. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workspace_arn"></a> [workspace\_arn](#output\_workspace\_arn) | The Amazon Resource Name (ARN) of the Grafana workspace |
| <a name="output_workspace_grafana_version"></a> [workspace\_grafana\_version](#output\_workspace\_grafana\_version) | The version of Grafana running on the workspace |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | The ID of the Grafana workspace |
<!-- END_TF_DOCS -->
