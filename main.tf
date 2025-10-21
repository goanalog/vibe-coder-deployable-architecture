provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.location
}

resource "ibm_cos_bucket" "vibe_spa" {
  bucket = "vibe-coder-spa-${random_id.bucket_id.hex}"
  acl    = var.make_public ? "public-read" : "private"
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "ibm_cos_bucket_object" "html_spa" {
  bucket      = ibm_cos_bucket.vibe_spa.bucket
  key         = "index.html"
  source      = null
  content     = var.vibe_code
  content_type = "text/html"
}
