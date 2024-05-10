grafana_workspace_name = "observability-demo"
cluster_name           = "antone-aguiar"

region = "us-east-2"
private_subnet_ids = [
  "subnet-0591a35350e585a02",
  "subnet-05d3e511f9d506a75",
  "subnet-07dbbae97ec4063fe"
]

security_group_ids = []
grafana_version    = "9.4"
enable_alerts      = true

grafana_admin_groups    = []
grafana_editor_groups   = []
grafana_readonly_groups = []

terraform_execution_role = null
global_tags = {
  creation-method  = "terraform"
  project          = "observability demo"
}
