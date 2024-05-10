###############################################################################
## Workspace
###############################################################################

output "workspace_arn" {
  description = "The Amazon Resource Name (ARN) of the Grafana workspace"
  value       = module.managed_grafana.workspace_arn
}

output "workspace_id" {
  description = "The ID of the Grafana workspace"
  value       = module.managed_grafana.workspace_id
}

resource "aws_ssm_parameter" "grafana_workspace_id" {
  name  = "/${local.eks_cluster_name}/grafana/grafana_workspace_id"
  type  = "String"
  value = module.managed_grafana.workspace_id
}
output "workspace_grafana_version" {
  description = "The version of Grafana running on the workspace"
  value       = module.managed_grafana.workspace_grafana_version
}

### API Key for Grafana Operator
resource "aws_ssm_parameter" "grafana_workspace_api_keys" {
  name        = "/${local.eks_cluster_name}/grafana/grafana_workspace_cluster_api_key"
  description = "SSM Secret to store grafana API Key"
  type        = "SecureString"
  value = jsonencode({
    GF_SECURITY_ADMIN_APIKEY = module.managed_grafana.workspace_api_keys.cluster.key
  })
}