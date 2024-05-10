data "aws_region" "current" {}

data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = local.eks_cluster_name
}

data "aws_ssm_parameter" "grafana_workspace_id" {
  name = "/${local.eks_cluster_name}/grafana/grafana_workspace_id"
}

data "aws_ssm_parameter" "grafana_workspace_cluster_api_key" {
  name = "/${local.eks_cluster_name}/grafana/grafana_workspace_cluster_api_key"
}

data "aws_grafana_workspace" "this" {
  workspace_id = local.managed_grafana_workspace_id
}
