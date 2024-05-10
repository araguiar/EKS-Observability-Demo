cluster_name             = "antone-aguiar"
region                   = "us-east-2"
terraform_execution_role = null
adot_loglevel            = "normal"
enable_dashboards        = true
irsa_iam_role_path       = "/"
alert_email_addresses    = []
global_tags = {
  creation-method  = "terraform"
  project          = "observability demo"
}
