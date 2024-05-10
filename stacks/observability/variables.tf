variable "cluster_name" {
  description = "EKS cluster name the workspace is deployed for."
  type        = string
}

variable "region" {
  description = "AWS Region being deployed to."
  type        = string
}

variable "terraform_execution_role" {
  description = "Role ARN to assume for Terraform execution."
  type        = string
  default     = null
}

variable "adot_loglevel" {
  description = "Verbosity level for ADOT Collector"
  type        = string
  default     = "normal"
}

variable "enable_dashboards" {
  description = "Enables or disables curated dashboards. Dashboards are managed by the Grafana Operator"
  type        = bool
  default     = true
}

variable "irsa_iam_role_path" {
  description = "IAM Role path for IRSA"
  type        = string
  default     = "/obs/"
}

variable "alert_email_addresses" {
  description = "Email addressses for Observability alerts"
  type        = list(string)
  default     = []
}

variable "global_tags" {
  description = "Map of key,value pairs to tag all resources."
  type        = map(string)
  default     = {}
}
