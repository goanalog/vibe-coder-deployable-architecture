terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.84.0"
    }
  }
}

provider "ibm" {}

# Resource group for the SPA
resource "ibm_resource_group" "vibe_rg" {
  name = "Vibe Coder RG"
}

# Cloud Object Storage instance
resource "ibm_resource_instance" "vibe_cos" {
  name            = "vibe-coder-cos"
  service         = "cloud-object-storage"
  plan            = "standard"
  resource_group  = ibm_resource_group.vibe_rg.id
  tags            = ["vibe-coder"]
}

# COS bucket to host the SPA
resource "ibm_cos_bucket" "vibe_spa_bucket" {
  name                  = "vibe-coder-spa"
  location              = "us-south"
  resource_instance_id  = ibm_resource_instance.vibe_cos.id
  force_destroy         = true
  public_access         = "true"
}

# Upload the user-provided HTML/JS/CSS to the bucket
resource "ibm_cos_bucket_object" "html_spa" {
  bucket        = ibm_cos_bucket.vibe_spa_bucket.name
  key           = "index.html"
  content       = var.vibe_code
  content_type  = "text/html"
}
