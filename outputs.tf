output "cos_bucket_name" {
  description = "The name of the IBM COS bucket hosting your SPA"
  value       = ibm_cos_bucket.vibe_spa_bucket.name
}

output "spa_url" {
  description = "The URL to access your Vibe Coder SPA"
  value       = "https://${ibm_cos_bucket.vibe_spa_bucket.name}.s3.${var.cos_bucket_location}.cloud-object-storage.appdomain.cloud/index.html"
}
