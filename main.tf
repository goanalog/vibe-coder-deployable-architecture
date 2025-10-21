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
  name = "vibe-coder-rg"
}

# COS instance
resource "ibm_resource_instance" "vibe_cos" {
  name            = "vibe-coder-cos"
  service         = "cloud-object-storage"
  plan            = "standard"
  resource_group  = ibm_resource_group.vibe_rg.id
}

# Bucket
resource "ibm_cos_bucket" "vibe_spa_bucket" {
  cos_instance_id = ibm_resource_instance.vibe_cos.id
}

# Initial SPA HTML object
resource "ibm_cos_bucket_object" "html_spa" {
  bucket      = ibm_cos_bucket.vibe_spa_bucket.name
  key         = "index.html"
  content     = file("${path.module}/default_index.html")
  content_type = "text/html"
}
