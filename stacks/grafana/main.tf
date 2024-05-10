module "managed_grafana" {
  source  = "terraform-aws-modules/managed-service-grafana/aws"
  version = "~>2.1"

  name                      = var.grafana_workspace_name
  associate_license         = false
  description               = local.description
  permission_type           = "SERVICE_MANAGED"
  data_sources              = ["CLOUDWATCH", "PROMETHEUS", "XRAY"]
  notification_destinations = ["SNS"]
  stack_set_name            = var.grafana_workspace_name
  grafana_version           = var.grafana_version
  enable_alerts             = var.enable_alerts

  configuration = jsonencode({
    unifiedAlerting = {
      enabled = true
    },
    plugins = {
      pluginAdminEnabled = true
    }
  })

  # Workspace API keys
  workspace_api_keys = {
    viewer = {
      key_name        = "viewer"
      key_role        = "VIEWER"
      seconds_to_live = 3600
    }
    editor = {
      key_name        = "editor"
      key_role        = "EDITOR"
      seconds_to_live = 3600
    }
    admin = {
      key_name        = "admin"
      key_role        = "ADMIN"
      seconds_to_live = 3600
    }
    cluster = {
      key_name        = "cluster"
      key_role        = "ADMIN"
      seconds_to_live = 3600
    }
  }

  # Workspace IAM role
  create_iam_role                = true
  iam_role_name                  = var.grafana_workspace_name
  use_iam_role_name_prefix       = true
  iam_role_description           = local.description
  iam_role_path                  = "/grafana/"
  iam_role_force_detach_policies = true
  iam_role_max_session_duration  = 7200
}
