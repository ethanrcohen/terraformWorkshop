variable "gcp_project_id" {
  type        = string
  description = "GCP project to build resources in"
}

variable "cf_api_token" {
    type = string
    description = "API Token for Cloudflare account"
}

provider "google" {
  version = "~> 2"

  project = var.gcp_project_id
  region  = "us-west1"
  zone    = "us-west1-b"
}


provider "cloudflare" {
  version = "~> 2"
  api_token = var.cf_api_token
}
