provider "IBM-Cloud/ibm" {
  region = var.cos_region
}

# ------------------------------------------------------------
# Create COS Bucket
# ------------------------------------------------------------
resource "ibm_resource_instance" "cos_bucket" {
  name           = var.cos_bucket_name
  service        = "cloud-object-storage"
  plan           = "standard"
  resource_group = var.cos_resource_group
}

# ------------------------------------------------------------
# Upload Sample App HTML
# ------------------------------------------------------------
resource "ibm_cos_bucket_object" "sample_app_index" {
  bucket       = ibm_resource_instance.cos_bucket.name
  key          = "index.html"
  content_type = "text/html"
  source       = var.index_html_path
}

# ------------------------------------------------------------
# Apply Public Access if requested
# ------------------------------------------------------------
resource "ibm_cos_bucket_acl" "public_access" {
  bucket = ibm_resource_instance.cos_bucket.name
  acl    = var.public_access ? "public-read" : "private"
}

# ------------------------------------------------------------
# If user pasted vibe code, overwrite sample app
# ------------------------------------------------------------
resource "local_file" "vibe_code_file" {
  filename = var.index_html_path
  content  = var.vibe_code
  depends_on = [ibm_resource_instance.cos_bucket]
}
