#######################################################
# IBM Cloud Terraform: Vibe Coder Deployable Architecture
#######################################################

terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.84.0"
    }
  }
  required_version = ">= 1.12"
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

#######################################################
# Cloud Object Storage (COS) Instance
#######################################################

resource "ibm_resource_instance" "cos_instance" {
  name     = var.cos_name
  service  = "cloud-object-storage"
  plan     = "standard"
  location = var.region
}

#######################################################
# COS Bucket
#######################################################

resource "ibm_cos_bucket" "bucket" {
  bucket               = var.bucket_name
  resource_instance_id = ibm_resource_instance.cos_instance.id
  acl                  = var.make_public ? "public-read" : "private"
}

#######################################################
# Upload index.html to COS Bucket
#######################################################

resource "ibm_cos_bucket_object" "index" {
  bucket      = ibm_cos_bucket.bucket.bucket
  key         = "index.html"
  source      = var.index_file_path
  content_type = "text/html"
}
