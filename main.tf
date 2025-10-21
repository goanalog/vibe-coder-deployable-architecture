terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.60" 
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.api_key
}

data "ibm_resource_group" "default" {
  name = "Default"
}

resource "ibm_resource_instance" "cos_instance" {
  name              = var.cos_instance_name
  service           = "cloud-object-storage"
  plan              = var.cos_plan
  location          = var.cos_bucket_location
  resource_group_id = var.resource_group_id != null ? var.resource_group_id : data.ibm_resource_group.default.id
}

locals {
  spa_content = var.pasted_code
}

resource "ibm_cos_bucket" "vibe_spa_bucket" {
  # --- FIX 1 ---
  bucket_name          = var.cos_bucket_name 
  resource_instance_id = ibm_resource_instance.cos_instance.id 
  # --- FIX 2 ---
  region_location      = var.cos_bucket_location 
}

resource "ibm_cos_bucket_object" "vibe_index" {
  count = length(var.pasted_code) > 0 ? 1 : 0

  bucket_location = ibm_cos_bucket.vibe_spa_bucket.region_location # Also update this to match
  bucket          = ibm_cos_bucket.vibe_spa_bucket.bucket_name    # Also update this to match
  key             = "index.html"
  content         = local.spa_content
}

output "spa_url" {
  value = length(var.pasted_code) > 0 ? "https://${ibm_cos_bucket.vibe_spa_bucket.bucket_name}.s3.${ibm_cos_bucket.vibe_spa_bucket.region_location}.cloud-object-storage.appdomain.cloud/index.html" : "No HTML provided. Bucket was created, but no SPA is deployed."
  description = "Key URL to access your deployed SPA"
}