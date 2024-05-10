<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.36.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 2.0.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_monitoring"></a> [eks\_monitoring](#module\_eks\_monitoring) | github.com/aws-observability/terraform-aws-observability-accelerator//modules/eks-monitoring | v2.12.0 |

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.prometheus_alerts_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.grafana_alert_sub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [kubectl_manifest.cluster_secretstore](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.grafana_namespace](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.grafana_secret](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_grafana_workspace.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/grafana_workspace) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_ssm_parameter.grafana_workspace_cluster_api_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.grafana_workspace_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | EKS cluster name the workspace is deployed for. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region being deployed to. | `string` | n/a | yes |
| <a name="input_adot_loglevel"></a> [adot\_loglevel](#input\_adot\_loglevel) | Verbosity level for ADOT Collector | `string` | `"normal"` | no |
| <a name="input_alert_email_addresses"></a> [alert\_email\_addresses](#input\_alert\_email\_addresses) | Email addressses for Observability alerts | `list(string)` | `[]` | no |
| <a name="input_enable_dashboards"></a> [enable\_dashboards](#input\_enable\_dashboards) | Enables or disables curated dashboards. Dashboards are managed by the Grafana Operator | `bool` | `true` | no |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Map of key,value pairs to tag all resources. | `map(string)` | `{}` | no |
| <a name="input_irsa_iam_role_path"></a> [irsa\_iam\_role\_path](#input\_irsa\_iam\_role\_path) | IAM Role path for IRSA | `string` | `"/obs/"` | no |
| <a name="input_terraform_execution_role"></a> [terraform\_execution\_role](#input\_terraform\_execution\_role) | Role ARN to assume for Terraform execution. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->