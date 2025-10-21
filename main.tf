terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.84.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
}

resource "ibm_resource_group" "vibe_rg" {
  name = "vibe-coder-rg"
}

resource "ibm_resource_instance" "vibe_cos" {
  name              = "vibe-coder-cos"
  service           = "cloud-object-storage"
  plan              = "standard"
  resource_group_id = ibm_resource_group.vibe_rg.id
}

resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket   = "vibe-coder-sample-bucket"
  instance = ibm_resource_instance.vibe_cos.id
}

resource "ibm_cos_bucket_object" "html_spa" {
  bucket       = ibm_cos_bucket.vibe_spa_bucket.bucket
  key          = "index.html"
  content      = var.vibe_code
  content_type = "text/html"
}
