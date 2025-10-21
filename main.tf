# --- Required Providers ---
terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.54.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

# --- Provider Configuration ---
provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.location
}

# --- Data Sources ---
data "ibm_resource_group" "group" {
  name = var.resource_group_name
}

# --- Random Suffix ---
resource "random_id" "suffix" {
  byte_length = 4
}

# --- Cloud Object Storage Instance ---
resource "ibm_resource_instance" "cos" {
  name              = var.cos_instance_name
  service           = "cloud-object-storage"
  plan              = "lite"
  location          = "global"
  resource_group_id = data.ibm_resource_group.group.id
}

# --- COS Bucket ---
resource "ibm_cos_bucket" "sample" {
  bucket_name          = "${var.bucket_name_prefix}-${random_id.suffix.hex}"
  resource_instance_id = ibm_resource_instance.cos.id
  region_location      = var.location
  endpoint_type        = "public"
  force_delete         = true
}

# --- Public Read Policy ---
resource "ibm_cos_bucket_policy" "public_read" {
  count           = var.make_public ? 1 : 0
  bucket_crn      = ibm_cos_bucket.sample.crn
  bucket_location = ibm_cos_bucket.sample.region_location
  policy          = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = "*",
      Action    = ["s3:GetObject"],
      Resource  = ["arn:aws:s3:::${ibm_cos_bucket.sample.bucket_name}/*"]
    }]
  })
}

# --- Upload HTML ---
resource "ibm_cos_bucket_object" "html_spa" {
  depends_on      = [ibm_cos_bucket.sample]
  bucket_crn      = ibm_cos_bucket.sample.crn
  bucket_location = ibm_cos_bucket.sample.region_location
  key             = "index.html"
  content         = var.html_content
  endpoint_type   = "public"
  force_delete    = true
}

# --- Output URL ---
output "application_url" {
  description = "Public URL for the hosted Single Page Application."
  value = (
    try(
      "https://${ibm_cos_bucket.sample.s3_endpoint_public}/${ibm_cos_bucket_object.html_spa.key}",
      "https://${ibm_cos_bucket.sample.s3_endpoint_public_url}/${ibm_cos_bucket_object.html_spa.key}"
    )
  )
}
