terraform {
  required_version = ">= 1.12"

  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.84.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

# Create COS instance
resource "ibm_resource_instance" "cos_instance" {
  name              = var.cos_name
  service           = "cloud-object-storage"
  plan              = var.cos_plan
  resource_group_id = data.ibm_resource_group.selected.id
  tags              = ["vibe-coder"]
}

data "ibm_resource_group" "selected" {
  name = var.resource_group
}

# Create COS bucket
resource "ibm_cos_bucket" "bucket" {
  name              = var.bucket_name != "" ? var.bucket_name : "${var.cos_name}-bucket"
  location          = var.region
  storage_class     = var.cos_storage_class
  bucket_access_type = var.make_public ? "public" : "private"
}

# Upload SPA HTML
resource "ibm_cos_bucket_object" "index" {
  bucket       = ibm_cos_bucket.bucket.name
  key          = "index.html"
  source       = var.sample_app_html != "" ? "" : var.html_file_path
  content      = var.sample_app_html != "" ? var.sample_app_html : null
  depends_on   = [ibm_cos_bucket.bucket]
}
