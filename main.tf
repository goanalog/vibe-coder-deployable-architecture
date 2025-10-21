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
  region           = var.location
}

variable "ibmcloud_api_key" {
  description = "Your IBM Cloud API key — don’t worry, keep it secret!"
  type        = string
}

variable "location" {
  description = "IBM Cloud location for the COS instance"
  type        = string
  default     = "us-south"
}

variable "cos_bucket_name" {
  description = "Name of the COS bucket where your Vibe Code SPA will live — don’t worry, you can change it!"
  type        = string
  default     = "vibe-coder-spa"
}

variable "vibe_code" {
  description = "Paste your Vibe Coder HTML/SPA code here"
  type        = string
}

resource "ibm_resource_instance" "vibe_cos" {
  name              = var.cos_bucket_name
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = var.location
}

resource "ibm_cos_bucket" "vibe_spa_bucket" {
  name     = var.cos_bucket_name
  location = ibm_resource_instance.vibe_cos.location
}

resource "ibm_cos_bucket_object" "html_spa" {
  bucket  = ibm_cos_bucket.vibe_spa_bucket.name
  key     = "index.html"
  content = var.vibe_code
}
