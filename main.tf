terraform {
  required_version = ">= 1.3.0"

  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "~> 1.60.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

# Create a Cloud Object Storage instance
resource "ibm_resource_instance" "cos_instance" {
  name              = var.cos_name
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = var.region
  resource_group_id = data.ibm_resource_group.group.id
}

# Data source for the target resource group
data "ibm_resource_group" "group" {
  name = var.resource_group
}

# Create a COS bucket for the uploaded HTML app
resource "ibm_cos_bucket" "vibe_bucket" {
  bucket_name          = var.cos_bucket_name
  resource_instance_id  = ibm_resource_instance.cos_instance.id
  region_location       = var.region
  storage_class         = "standard"
  force_delete          = true
}

# Upload your app’s index.html to the bucket
resource "ibm_cos_bucket_object" "vibe_index" {
  bucket_crn   = ibm_cos_bucket.vibe_bucket.crn
  key          = "index.html"
  content      = var.html_content
  content_type = "text/html"
}

# Output the public app URL
output "vibe_app_url" {
  description = "Your hosted vibe-coded app URL"
  value       = "https://s3.${var.region}.cloud-object-storage.appdomain.cloud/${var.cos_bucket_name}/index.html"
}
