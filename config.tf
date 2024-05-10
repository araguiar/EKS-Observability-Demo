terraform {
  required_version = "~> 1.7"

  # required_providers {
  #   kubectl = {
  #     source  = "alekc/kubectl"
  #     version = ">= 2.0"
  #   }
  # }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = var.global_tags
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.this.token
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.this.token
  }
}
