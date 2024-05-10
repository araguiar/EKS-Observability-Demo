locals {
  eks_cluster_id                    = data.aws_eks_cluster.this.id
  eks_cluster_name                  = data.aws_eks_cluster.this.name
  eks_cluster_endpoint              = data.aws_eks_cluster.this.endpoint

  ##For external secrets sync
  external_secrets_sa_name = "external-secrets-sa"
  grafana_namespace        = "grafana-operator"
  cluster_secretstore_name = "grafana-secretstore-sm"
  target_secret_name       = "grafana-admin-credentials"

  alerting_sns_topic        = "grafana-alerts-${local.eks_cluster_name}"
  alerting_sns_subscription = var.alert_email_addresses
}
