terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.84.0"
    }
    template = {
      source  = "hashicorp/template"
      version = ">= 2.2.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.location
}

resource "ibm_resource_group" "vibe_rg" {
  name = "vibe-coder-rg"
}

resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket  = "vibe-coder-spa"
  location = var.location
  force_destroy = true
}

data "template_file" "spa_html" {
  template = var.vibe_code
}

resource "ibm_cos_bucket_object" "html_spa" {
  bucket       = ibm_cos_bucket.vibe_spa_bucket.bucket
  key          = "index.html"
  content      = data.template_file.spa_html.rendered
  # content_type is now auto-detected
}

output "bucket_name" {
  value = ibm_cos_bucket.vibe_spa_bucket.bucket
}

output "spa_url" {
  value = "https://${ibm_cos_bucket.vibe_spa_bucket.bucket}.s3.${var.location}.cloud-object-storage.appdomain.cloud/index.html"
}
