terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.84.0"
    }
  }
}

provider "ibm" {}

# Resource group
resource "ibm_resource_group" "vibe_rg" {
  name = "Vibe Coder RG"
}

# Cloud Object Storage instance
resource "ibm_resource_instance" "vibe_cos" {
  name     = "vibe-coder-cos"
  service  = "cloud-object-storage"
  plan     = "standard"
  location = "us-south"
  tags     = ["vibe-coder"]
}

# COS bucket
resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket_name          = "vibe-coder-spa"
  resource_instance_id = ibm_resource_instance.vibe_cos.id
}

# Upload user HTML
resource "ibm_cos_bucket_object" "html_spa" {
  bucket_crn     = ibm_cos_bucket.vibe_spa_bucket.bucket_crn
  bucket_location = ibm_cos_bucket.vibe_spa_bucket.location
  key            = "index.html"
  content        = var.vibe_code
  content_type   = "text/html"
}
