provider "ibm" {
  region = var.cloud_region
}

# ------------------------------------------------------------
# Create COS Bucket for Sample Application
# ------------------------------------------------------------
resource "ibm_resource_instance" "cos_bucket" {
  name           = var.bucket_name
  service        = "cloud-object-storage"
  plan           = "standard"
  resource_group = var.resource_group
}

# ------------------------------------------------------------
# Upload Sample Application HTML File
# ------------------------------------------------------------
resource "ibm_cos_bucket_object" "sample_app_index" {
  bucket       = ibm_resource_instance.cos_bucket.name
  key          = "index.html"
  source       = var.html_file_path
  content_type = "text/html"
}

# ------------------------------------------------------------
# Set Public Access if Requested
# ------------------------------------------------------------
resource "ibm_cos_bucket_acl" "public_access" {
  bucket = ibm_resource_instance.cos_bucket.name
  acl    = var.make_public ? "public-read" : "private"
}
