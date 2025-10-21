provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.cos_bucket_location
}

# Find or create COS instance
data "ibm_resource_instance" "cos_instance" {
  name              = var.cos_name
  resource_group_id = var.resource_group_id
  service           = "cloud-object-storage"
}

# Create COS bucket
resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket           = var.cos_bucket_name
  resource_instance_id = data.ibm_resource_instance.cos_instance.id
  force_delete     = true
}

# Optional: Upload index.html if provided
resource "ibm_cos_bucket_object" "vibe_index" {
  count         = length(var.index_html_file) > 0 ? 1 : 0
  bucket        = ibm_cos_bucket.vibe_spa_bucket.bucket
  key           = "index.html"
  source        = var.index_html_file
  content_type  = "text/html"
  bucket_location = var.cos_bucket_location
}
