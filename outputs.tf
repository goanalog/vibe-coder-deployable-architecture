output "cos_bucket_name" {
  value       = ibm_cos_bucket.vibe_spa_bucket.bucket_name
  description = "The name of the COS bucket hosting your SPA"
}

output "spa_url" {
  value       = "https://${ibm_cos_bucket.vibe_spa_bucket.bucket_name}.s3.${var.cos_bucket_location}.cloud-object-storage.appdomain.cloud/index.html"
  description = "URL to access your deployed SPA"
}
