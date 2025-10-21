provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.location
}

resource "ibm_cos_bucket" "vibe_bucket" {
  name          = "vibe-coder-sample-bucket"
  location      = var.location
  force_destroy = true
  acl           = var.make_public ? "public-read" : "private"
}

resource "ibm_cos_bucket_object" "html_spa" {
  bucket       = ibm_cos_bucket.vibe_bucket.name
  key          = "index.html"
  content      = var.vibe_code
  # Do NOT set content_type; IBM COS will detect automatically
}

output "bucket_name" {
  value = ibm_cos_bucket.vibe_bucket.name
}

output "spa_url" {
  value = "https://${ibm_cos_bucket.vibe_bucket.name}.s3.${var.location}.cloud-object-storage.appdomain.cloud/index.html"
}
