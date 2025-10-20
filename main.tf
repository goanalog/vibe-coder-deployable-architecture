terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = "~> 1.84"
    }
  }
}

provider "ibm" {}

# COS Bucket
resource "ibm_cos_bucket" "sample" {
  bucket_name         = var.cos_bucket_name
  resource_instance_id = ibm_resource_instance.cos.id
  force_destroy        = true
  public_access        = var.make_public ? "true" : "false"
}

# COS Object for SPA
resource "ibm_cos_object" "sample_app" {
  bucket       = ibm_cos_bucket.sample.bucket_name
  key          = "index.html"
  content      = var.custom_html != "" ? var.custom_html : file("${path.module}/index.html")
  content_type = "text/html"
}

# COS Instance
resource "ibm_resource_instance" "cos" {
  name           = "${var.cos_bucket_name}-instance"
  service        = "cloud-object-storage"
  plan           = "standard"
  region         = var.region
  tags           = ["vibe-coder", "spa"]
}
