terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.84.0"
    }
  }

  required_version = ">= 1.0"
}

provider "ibm" {
  ibmcloud_api_key = var.api_key
  region           = var.region
}

##########################
# Variables
##########################

variable "api_key" {
  type        = string
  description = "Your IBM Cloud API key"
}

variable "vibe_code" {
  type        = string
  description = "HTML code for the Vibe Coder SPA"
}

variable "region" {
  type        = string
  description = "IBM Cloud region to create resources in"
  default     = "us-south"
}

variable "bucket_name" {
  type        = string
  description = "COS bucket to host the SPA"
  default     = "vibe-coder-sample-bucket"
}

##########################
# COS Instance
##########################

resource "ibm_resource_instance" "vibe_cos" {
  name       = "vibe-coder-cos"
  service    = "cloud-object-storage"
  plan       = "standard"
  region     = var.region
}

##########################
# COS Bucket
##########################

resource "ibm_cos_bucket" "vibe_spa_bucket" {
  name                 = var.bucket_name
  resource_instance_id = ibm_resource_instance.vibe_cos.id
}

##########################
# Upload HTML as Object
##########################

resource "ibm_cos_bucket_object" "html_spa" {
  bucket_crn   = ibm_cos_bucket.vibe_spa_bucket.bucket_crn
  bucket_name  = ibm_cos_bucket.vibe_spa_bucket.name
  key          = "index.html"
  content      = var.vibe_code
  content_type = "text/html"
}
