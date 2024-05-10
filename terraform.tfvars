cluster_name = "antone-aguiar"
region       = "us-east-2"
global_tags = {
  creation-method = "terraform"
  project         = "observability demo"
}

##
# Grafana
##
grafana_workspace_name = "observability-demo"
grafana_private_subnet_ids = [
  "subnet-0591a35350e585a02",
  "subnet-05d3e511f9d506a75",
  "subnet-07dbbae97ec4063fe"
]

grafana_security_group_ids = []
grafana_version            = "9.4"
grafana_enable_alerts      = true

grafana_admin_groups    = []
grafana_editor_groups   = []
grafana_readonly_groups = []

##
# Observability Accelerator
##
adot_loglevel         = "normal"
enable_dashboards     = true
irsa_iam_role_path    = "/"
alert_email_addresses = []
