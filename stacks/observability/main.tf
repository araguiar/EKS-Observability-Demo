module "eks_monitoring" {
  source = "github.com/aws-observability/terraform-aws-observability-accelerator//modules/eks-monitoring?ref=v2.12.1"

  eks_cluster_id     = local.eks_cluster_id
  irsa_iam_role_name = "${local.eks_cluster_name}-adot-role-irsa"

  enable_alertmanager       = true
  enable_managed_prometheus = true
  # deploys AWS Distro for OpenTelemetry operator into the cluster
  enable_amazon_eks_adot          = true
  adot_loglevel                   = var.adot_loglevel
  adot_service_telemetry_loglevel = "DEBUG"
  enable_adotcollector_metrics    = true

  enable_cert_manager = true

  enable_kube_state_metrics   = true
  enable_apiserver_monitoring = true
  enable_alerting_rules       = true
  enable_recording_rules      = true
  enable_nginx                = true
  enable_logs                 = false # set to false since eks-addon module deploys fluent-bit


  # deploys external-secrets in to the cluster
  enable_grafana_operator = true
  enable_external_secrets = true
  enable_fluxcd           = true
  grafana_api_key         = local.grafana_workspace_cluster_api_key
  target_secret_name      = local.target_secret_name
  target_secret_namespace = local.grafana_namespace
  grafana_url             = "https://${data.aws_grafana_workspace.this.endpoint}"

  # control the publishing of dashboards by specifying the boolean value for the variable 'enable_dashboards', default is 'true'
  enable_dashboards = var.enable_dashboards

  # optional, defaults to 60s interval and 15s timeout
  prometheus_config = {
    global_scrape_interval = "60s"
    global_scrape_timeout  = "15s"
  }

  ne_config = {
    helm_settings = {
      "tolerations[0].operator" = "Exists"
    }
  }

  nginx_config = {
    scrape_sample_limit = 10000
  }
}

resource "aws_sns_topic" "prometheus_alerts_topic" {
  name = local.alerting_sns_topic
}

resource "aws_sns_topic_subscription" "grafana_alert_sub" {
  for_each  = toset(var.alert_email_addresses)
  topic_arn = aws_sns_topic.prometheus_alerts_topic.arn
  protocol  = "email"
  endpoint  = each.value
}
