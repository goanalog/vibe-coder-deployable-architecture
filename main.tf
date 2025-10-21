provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.location
}

resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket = "vibe-coder-spa-${random_pet.bucket_suffix.id}"
  location = var.location
  force_destroy = true
}

resource "random_pet" "bucket_suffix" {
  length = 2
}

resource "ibm_cos_bucket_object" "html_spa" {
  bucket = ibm_cos_bucket.vibe_spa_bucket.bucket
  key    = "index.html"
  content = var.vibe_code
}

output "spa_url" {
  value = "https://${ibm_cos_bucket.vibe_spa_bucket.bucket}.s3.${var.location}.cloud-object-storage.appdomain.cloud/index.html"
}
