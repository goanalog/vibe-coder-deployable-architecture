terraform {
  required_version = ">= 1.2"

  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.84.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.cos_bucket_location
}

resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket_name = var.cos_bucket_name
  location    = var.cos_bucket_location
}

resource "ibm_cos_bucket_object" "html_spa" {
  bucket_crn = ibm_cos_bucket.vibe_spa_bucket.crn
  key        = "index.html"
  source     = "index.html"
}
