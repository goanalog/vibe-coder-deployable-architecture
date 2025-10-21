terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.84.0"
    }
  }
}

provider "ibm" {}

# Input variable (inline)
variable "vibe_code" {
  type        = string
  description = "Paste your HTML code here. This drives the Vibe Coder app!"
  default     = "<!DOCTYPE html><html><body><h1>Hello, Vibe!</h1></body></html>"
}

# Resource group
resource "ibm_resource_group" "vibe_rg" {
  name = "vibe-coder-rg"
}

# Cloud Object Storage instance
resource "ibm_resource_instance" "vibe_cos" {
  name           = "vibe-coder-cos"
  service        = "cloud-object-storage"
  plan           = "standard"
  resource_group = ibm_resource_group.vibe_rg.id
  location       = "us-south"
}

# Bucket
resource "ibm_cos_bucket" "vibe_spa_bucket" {
  cos_instance_id = ibm_resource_instance.vibe_cos.id
  bucket          = "vibe-coder-bucket"
}

# Upload HTML from input
resource "ibm_cos_bucket_object" "html_spa" {
  bucket       = ibm_cos_bucket.vibe_spa_bucket.name
  key          = "index.html"
  content      = var.vibe_code
  content_type = "text/html"
}
