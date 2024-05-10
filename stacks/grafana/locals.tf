locals {
  description      = "AWS Managed Grafana service for ${var.grafana_workspace_name}"
  eks_cluster_name = data.aws_eks_cluster.this.name
}
