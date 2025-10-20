terraform {
  required_version = ">= 1.12"
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "~> 1.38"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

# Create COS bucket
resource "ibm_cos_bucket" "bucket" {
  bucket_name      = length(var.bucket_name) > 0 ? var.bucket_name : "${var.cos_name}-bucket"
  cos_instance_crn = var.cos_crn
  location         = var.region
  storage_class    = "standard"
  public_access    = var.make_public
}

# Resource key for COS
resource "ibm_resource_key" "cos_key" {
  name       = "${var.cos_name}-key"
  role       = "Writer"
  source_crn = var.cos_crn
}

# Upload sample app
resource "ibm_cos_bucket_object" "index" {
  bucket_crn      = ibm_cos_bucket.bucket.crn
  bucket_location = ibm_cos_bucket.bucket.location
  key             = "index.html"
  source          = length(var.sample_app_html) > 0 ? "${path.module}/temp_index.html" : "${path.module}/sample-app-index.html"
}

# Generate temp_index.html from catalog paste
resource "local_file" "temp_index" {
  content  = var.sample_app_html
  filename = "${path.module}/temp_index.html"
  depends_on = [var.sample_app_html]
  lifecycle {
    ignore_changes = [filename]
  }
}
