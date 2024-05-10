terraform {
  required_version = "~> 1.7"
}

provider "aws" {
  region = var.region

  default_tags {
    tags = var.global_tags
  }
}
