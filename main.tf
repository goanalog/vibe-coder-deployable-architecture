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
  region           = var.location
}

# Resource Group
resource "ibm_resource_group" "vibe_rg" {
  name = "vibe-coder-rg"
}

# COS Service Instance
resource "ibm_resource_instance" "vibe_cos" {
  name               = "vibe-coder-cos"
  resource_group_id   = ibm_resource_group.vibe_rg.id
  service             = "cloud-object-storage"
  plan                = "standard"
  location            = var.location
}

# COS Bucket
resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket               = var.cos_bucket_name
  resource_instance_id = ibm_resource_instance.vibe_cos.id
}

# COS Bucket Object (SPA HTML)
resource "ibm_cos_bucket_object" "html_spa" {
  bucket_crn      = ibm_cos_bucket.vibe_spa_bucket.bucket_crn
  bucket_location = ibm_cos_bucket.vibe_spa_bucket.location
  key             = "index.html"
  content         = var.vibe_code
}

# Optional Outputs
output "cos_bucket_name" {
  value = ibm_cos_bucket.vibe_spa_bucket.bucket
}

output "cos_bucket_crn" {
  value = ibm_cos_bucket.vibe_spa_bucket.bucket_crn
}

output "spa_object_key" {
  value = ibm_cos_bucket_object.html_spa.key
}