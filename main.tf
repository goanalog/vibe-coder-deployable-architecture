provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

# Optionally create COS instance if none is provided
resource "ibm_resource_instance" "cos" {
  count         = var.existing_cos_id == "" ? 1 : 0
  name          = var.cos_name
  service       = "cloud-object-storage"
  resource_group = var.resource_group_id
  plan          = "standard"
}

# Use existing COS instance ID if provided
locals {
  cos_instance_id = var.existing_cos_id != "" ? var.existing_cos_id : ibm_resource_instance.cos[0].id
}

# Create bucket
resource "ibm_cos_bucket" "sample" {
  bucket_name          = var.bucket_name
  resource_instance_id = local.cos_instance_id
  public_access        = var.make_public
}

# Upload sample HTML as object
resource "ibm_cos_object" "sample_app" {
  bucket        = ibm_cos_bucket.sample.bucket_name
  key           = "index.html"
  data          = var.sample_app_html
  resource_instance_id = local.cos_instance_id
}
