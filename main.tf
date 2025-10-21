terraform {
  required_version = ">= 1.12"
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.84.0"
    }
  }
}

# -------------------------
# Variables
# -------------------------
variable "cos_bucket_name" {
  description = "Name your IBM Cloud Object Storage bucket. Don't worry, it just needs to be unique in your region."
  type        = string
  default     = "vibe-coder-sample-bucket"
}

variable "cos_region" {
  description = "Region where your COS bucket will be created. Example: us-south"
  type        = string
  default     = "us-south"
}

# -------------------------
# IBM COS Bucket
# -------------------------
resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket_name = var.cos_bucket_name
  location    = var.cos_region
  force       = true  # allows re-creating if bucket exists
}

# -------------------------
# SPA HTML Object
# -------------------------
resource "ibm_cos_bucket_object" "html_spa" {
  bucket          = var.cos_bucket_name
  bucket_location = var.cos_region
  key             = "index.html"   # the name in the bucket
  source          = "index.html"   # local file to upload
  content_type    = "text/html"
}

# -------------------------
# Optional Output
# -------------------------
output "spa_url" {
  value       = "https://${var.cos_bucket_name}.s3.${var.cos_region}.cloud-object-storage.appdomain.cloud/index.html"
  description = "URL to access your deployed SPA."
}
terraform {
  required_version = ">= 1.12"
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.84.0"
    }
  }
}

resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket_name = var.cos_bucket_name
  location    = var.cos_region
  force       = true
}

resource "ibm_cos_bucket_object" "html_spa" {
  bucket          = var.cos_bucket_name
  bucket_location = var.cos_region
  key             = "index.html"
  source          = "index.html"
  content_type    = "text/html"
}
