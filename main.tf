provider "ibm" {
  region = var.region
}

# Create COS instance
resource "ibm_resource_instance" "cos" {
  name     = var.cos_name
  service  = "cloud-object-storage"
  plan     = "standard"
  location = var.region
}

# Create COS bucket
resource "ibm_cos_bucket" "sample" {
  bucket_name          = var.bucket_name
  resource_instance_id = ibm_resource_instance.cos.id
}

# Set public/private ACL
resource "ibm_cos_bucket_acl" "sample_acl" {
  bucket_name = ibm_cos_bucket.sample.bucket_name
  acl         = var.make_public ? "public-read" : "private"
}

# Upload default SPA HTML
resource "ibm_cos_object" "sample_html" {
  bucket       = ibm_cos_bucket.sample.bucket_name
  key          = "index.html"
  content      = var.sample_app_html
  content_type = "text/html"
}
