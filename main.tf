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

# --- NEW DATA SOURCE ---
# This finds the resource group named "Default" in your account
data "ibm_resource_group" "default" {
  name = "Default"
}
# ---------------------

# This creates the Cloud Object Storage service instance
resource "ibm_resource_instance" "cos_instance" {
  name              = var.cos_instance_name
  service           = "cloud-object-storage"
  plan              = var.cos_plan
  location          = var.cos_bucket_location
  
  # --- UPDATED LINE ---
  # Use the variable if provided, otherwise use the default group ID we found
  resource_group_id = var.resource_group_id != null ? var.resource_group_id : data.ibm_resource_group.default.id
}

locals {
  spa_content = var.pasted_code
}

resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket               = var.cos_bucket_name
  resource_instance_id = ibm_resource_instance.cos_instance.id 
  location             = var.cos_bucket_location
}

resource "ibm_cos_bucket_object" "vibe_index" {
  count = length(var.pasted_code) > 0 ? 1 : 0

  bucket_location = ibm_cos_bucket.vibe_spa_bucket.location
  bucket          = ibm_cos_bucket.vibe_spa_bucket.bucket
  key             = "index.html"
  content         = local.spa_content
}

output "spa_url" {
  value = length(var.pasted_code) > 0 ? "https://${ibm_cos_bucket.vibe_spa_bucket.bucket}.s3.${var.cos_bucket_location}.cloud-object-storage.appdomain.cloud/index.html" : "No HTML provided. Bucket was created, but no SPA is deployed."
  description = "Key URL to access your deployed SPA"
}