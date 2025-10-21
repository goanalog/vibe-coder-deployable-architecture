terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.84.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

# -----------------------------
# Resource Instance for COS
# -----------------------------
resource "ibm_resource_instance" "vibe_cos" {
  name     = "vibe-coder-cos"
  service  = "cloud-object-storage"
  plan     = "standard"
  location = var.region      # required
}

# -----------------------------
# COS Bucket
# -----------------------------
resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket                = var.cos_bucket_name          # bucket name
  resource_instance_id  = ibm_resource_instance.vibe_cos.id
}

# -----------------------------
# Upload SPA HTML
# -----------------------------
resource "ibm_cos_bucket_object" "html_spa" {
  bucket  = ibm_cos_bucket.vibe_spa_bucket.bucket
  key     = "index.html"
  content = var.vibe_code
}
