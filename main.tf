provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.location
}

resource "ibm_resource_group" "default" {
  name = "VibeCoderRG"
}

resource "ibm_cos_bucket" "spa_bucket" {
  bucket       = "vibe-coder-spa-${random_id.bucket_suffix.hex}"
  location     = var.location
  force       = true
  resource_group_id = ibm_resource_group.default.id
  public       = var.make_public
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "ibm_cos_bucket_object" "html_spa" {
  bucket       = ibm_cos_bucket.spa_bucket.name
  key          = "index.html"
  content      = var.vibe_code
  # Let COS auto-detect content_type
}
