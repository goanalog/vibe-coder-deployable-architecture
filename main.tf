locals {
  spa_content = length(var.local_file) > 0 ? file(var.local_file) : var.pasted_code
}

resource "ibm_cos_bucket" "vibe_spa_bucket" {
  bucket               = var.cos_bucket_name
  resource_instance_id = var.cos_instance_id
  location             = var.cos_bucket_location
}

resource "ibm_cos_bucket_object" "vibe_index" {
  bucket_location = ibm_cos_bucket.vibe_spa_bucket.location
  bucket          = ibm_cos_bucket.vibe_spa_bucket.bucket
  key             = "index.html"
  content         = local.spa_content
}

output "spa_url" {
  value       = "https://${ibm_cos_bucket.vibe_spa_bucket.bucket}.s3.${var.cos_bucket_location}.cloud-object-storage.appdomain.cloud/index.html"
  description = "Key URL to access your deployed SPA"
}

output "api_key_output" {
  value       = var.api_key
  description = "The IBM Cloud API key used in this workspace"
  sensitive   = true
}
