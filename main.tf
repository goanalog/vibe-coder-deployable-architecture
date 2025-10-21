terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.84.0"
    }
    # The "template" provider is no longer needed
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
  bucket_name          = "vibe-coder-spa" # Renamed from 'bucket' to 'bucket_name' for clarity
  location_constraint  = var.location     # Renamed from 'location' to 'location_constraint'

  force_destroy      = true
  resource_group_id  = ibm_resource_group.vibe_rg.id # <-- FIX: Assign the bucket to the resource group
  public_access        = var.make_public             # <-- FIX: Use the make_public variable
}

# This resource is no longer needed:
# data "template_file" "spa_html" {
#  template = var.vibe_code
# }

resource "ibm_cos_bucket_object" "html_spa" {
  bucket       = ibm_cos_bucket.vibe_spa_bucket.bucket_name
  key          = "index.html"
  content      = var.vibe_code # <-- FIX: Use the variable directly
  content_type = "text/html"   # Explicitly set content type for safety
}

output "bucket_name" {
  value = ibm_cos_bucket.vibe_spa_bucket.bucket_name
}

output "spa_url" {
  value = "https://${ibm_cos_bucket.vibe_spa_bucket.bucket_name}.s3.${var.location}.cloud-object-storage.appdomain.cloud/index.html"
}