terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.60" 
    }
    # --- ADD THIS PROVIDER ---
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.api_key
}

data "ibm_resource_group" "default" {
  name = "Default"
}

# --- ADD THIS RESOURCE ---
# Creates a 6-character random string (e.g., "a2b4n8")
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "ibm_resource_instance" "cos_instance" {
  name              = var.cos_instance_name
  service           = "cloud-object-storage"
  plan              = var.cos_plan
  location          = "global" 
  resource_group_id = var.resource_group_id != null ? var.resource_group_id : data.ibm_resource_group.default.id
}

locals {
  spa_content = var.pasted_code
  # --- ADD THIS LOCAL VARIABLE ---
  # Combines the prefix from the user with the random suffix
  bucket_name_unique = "${var.cos_bucket_name}-${random_string.suffix.result}"
}

resource "ibm_cos_bucket" "vibe_spa_bucket" {
  # --- UPDATE THIS LINE ---
  bucket_name          = local.bucket_name_unique
  resource_instance_id = ibm_resource_instance.cos_instance.id 
  region_location      = var.cos_bucket_location 
}

resource "ibm_cos_bucket_object" "vibe_index" {
  count = length(var.pasted_code) > 0 ? 1 : 0

  bucket_crn      = ibm_cos_bucket.vibe_spa_bucket.crn 
  bucket_location = ibm_cos_bucket.vibe_spa_bucket.region_location 
  key             = "index.html"
  content         = local.spa_content
}

output "spa_url" {
  # --- UPDATE THIS LINE ---
  value = length(var.pasted_code) > 0 ? "https://${local.bucket_name_unique}.s3.${ibm_cos_bucket.vibe_spa_bucket.region_location}.cloud-object-storage.appdomain.cloud/index.html" : "No HTML provided. Bucket was created, but no SPA is deployed."
  description = "Behold, the consecrated endpoint for direct vibe consumption. This isn't just a link; it's a globally propagated portal where the digital consciousness can bask in the glow of your manifested aesthetic. Share wisely—unfiltered vibes can be disorienting to the uninitiated."
}