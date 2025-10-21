provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.cos_bucket_location
}

resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket_name = var.cos_bucket_name
  location    = var.cos_bucket_location
  force_destroy = true
}

resource "ibm_cos_bucket_object" "html_spa" {
  bucket_crn = ibm_cos_bucket.vibe_spa_bucket.bucket_crn
  key        = "index.html"
  content    = var.html_content
  content_type = "text/html"
}
