terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.54.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
}

data "ibm_resource_group" "group" {
  name = var.resource_group_name
}

resource "ibm_resource_instance" "cos" {
  name              = var.cos_instance_name
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = var.location
  resource_group_id = data.ibm_resource_group.group.id
}

resource "ibm_cos_bucket" "sample" {
  # --- THIS IS THE FIX ---
  bucket_name          = var.bucket_name 
  # ---------------------
  resource_instance_id = ibm_resource_instance.cos.id
  force_destroy        = true
  public_access        = var.make_public
}

resource "ibm_cos_object" "html_spa" {
  bucket       = ibm_cos_bucket.sample.bucket_name
  key          = "index.html"
  content      = var.html_content
  content_type = "text/html"
}