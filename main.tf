terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.84.0"
    }
  }
}

provider "ibm" {}

data "ibm_resource_group" "group" {
  name = var.resource_group
}

# --- Cloud Object Storage instance ---
resource "ibm_resource_instance" "cos_instance" {
  name              = var.cos_name
  service           = "cloud-object-storage"
  plan              = var.cos_plan
  location          = var.region
  resource_group_id = data.ibm_resource_group.group.id
}

# --- Bucket ---
resource "ibm_cos_bucket" "bucket" {
  bucket_name          = "${var.cos_name}-bucket"
  resource_instance_id  = ibm_resource_instance.cos_instance.id
  region_location       = var.region
  storage_class         = "standard"
}

# --- Default or user-supplied web app ---
resource "ibm_cos_bucket_object" "index" {
  bucket_crn       = ibm_cos_bucket.bucket.crn
  bucket_location  = ibm_cos_bucket.bucket.region_location
  key              = "index.html"
  content          = var.sample_app_html
  content_type     = "text/html"
}

output "cos_bucket_name" {
  value = ibm_cos_bucket.bucket.bucket_name
}

output "cos_url" {
  value = "https://${ibm_cos_bucket.bucket.bucket_name}.s3.${var.region}.cloud-object-storage.appdomain.cloud/index.html"
}
