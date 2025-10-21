# --- Required Providers ---
terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.54.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

# --- Provider Configuration ---
provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.location
}

# --- Data Sources ---
data "ibm_resource_group" "group" {
  name = var.resource_group_name
}

# --- Random Suffix for Bucket Name ---
resource "random_id" "suffix" {
  byte_length = 4
}

# --- COS Service Instance ---
resource "ibm_resource_instance" "cos" {
  name              = var.cos_instance_name
  service           = "cloud-object-storage"
  plan              = "lite"
  location          = "global"
  resource_group_id = data.ibm_resource_group.group.id
}

# --- COS Bucket ---
resource "ibm_cos_bucket" "sample" {
  bucket_name          = "${var.bucket_name_prefix}-${random_id.suffix.hex}"
  resource_instance_id = ibm_resource_instance.cos.id
  region_location      = var.location
  endpoint_type        = "public"
  force_delete         = true
  acl                  = var.make_public ? "public-read" : "private"
}

# --- Upload Vibe Code SPA ---
resource "ibm_cos_bucket_object" "html_spa" {
  bucket_crn      = ibm_cos_bucket.sample.crn
  bucket_location = ibm_cos_bucket.sample.region_location
  key             = "index.html"
  content         = var.vibe_code
  endpoint_type   = "public"
  force_delete    = true
}

# --- Output ---
output "application_url" {
  description = "The public URL for the live-editable SPA."
  value       = "https://${ibm_cos_bucket.sample.s3_endpoint}/${ibm_cos_bucket_object.html_spa.key}"
}
