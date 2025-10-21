terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "~> 1.84.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = "us-south"
}

# Create a COS instance
resource "ibm_resource_instance" "vibe_cos_instance" {
  name       = var.cos_bucket_name
  service    = "cloud-object-storage"
  plan       = "standard"
  resource_group = "default" # adjust if you use a different group
}

# Create COS bucket
resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket           = var.cos_bucket_name
  resource_instance_id = ibm_resource_instance.vibe_cos_instance.id
}

# Upload index.html from vibe_code variable
resource "ibm_cos_bucket_object" "vibe_index" {
  bucket          = ibm_cos_bucket.vibe_spa_bucket.bucket
  key             = "index.html"
  content         = var.vibe_code
  content_type    = "text/html"
  bucket_location = ibm_cos_bucket.vibe_spa_bucket.location
}

# Output SPA URL
output "spa_url" {
  description = "The URL of your deployed Vibe Coder SPA"
  value       = "https://${ibm_cos_bucket.vibe_spa_bucket.bucket}.s3.${ibm_cos_bucket.vibe_spa_bucket.location}.cloud-object-storage.appdomain.cloud/index.html"
}
