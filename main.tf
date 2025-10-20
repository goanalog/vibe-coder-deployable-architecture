terraform {
  required_version = ">= 1.12"
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

# Create COS instance
resource "ibm_resource_instance" "cos_instance" {
  name     = var.cos_name
  service  = "cloud-object-storage"
  plan     = var.cos_plan
  region   = var.region
  resource_group = var.resource_group
}

# Create COS bucket
resource "ibm_cos_bucket_v2" "bucket" {
  bucket     = var.bucket_name != "" ? var.bucket_name : "${var.cos_name}-bucket"
  cos_instance_crn = ibm_resource_instance.cos_instance.crn
  storage_class = var.cos_storage_class
  public_access = var.make_public
}

# Write sample_app_html to a temp file for upload
data "local_file" "sample_html" {
  content  = var.sample_app_html
  filename = "${path.module}/temp_index.html"
}

# Upload HTML to COS bucket
resource "ibm_cos_bucket_object_v2" "index" {
  bucket = ibm_cos_bucket_v2.bucket.bucket
  key    = "index.html"
  source = data.local_file.sample_html.filename
}

output "bucket_name" {
  value = ibm_cos_bucket_v2.bucket.bucket
}

output "app_url" {
  value = "https://${ibm_cos_bucket_v2.bucket.bucket}.s3.${var.region}.cloud-object-storage.appdomain.cloud/index.html"
}
