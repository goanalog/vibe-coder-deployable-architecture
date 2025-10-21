terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.84.0"
    }
  }
  required_version = ">= 1.2.0"
}


# Create IBM Cloud Object Storage instance
resource "ibm_resource_instance" "vibe_cos" {
  name     = "vibe-coder-cos"
  service  = "cloud-object-storage"
  plan     = "standard"
  location = var.region
}

# Create COS bucket (Terraform 1.12 syntax)
resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket_name          = var.cos_bucket_name
  resource_instance_id = ibm_resource_instance.vibe_cos.id
}

# Upload HTML SPA
resource "ibm_cos_bucket_object" "html_spa" {
  bucket_location = ibm_cos_bucket.vibe_spa_bucket.location
  bucket_crn      = ibm_cos_bucket.vibe_spa_bucket.crn
  key             = "index.html"
  content         = var.vibe_code
}
