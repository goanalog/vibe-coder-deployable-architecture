output "spa_url" {
  description = "🎉 Your Vibe Coder SPA URL — click to open or copy!"
  value       = "https://${ibm_cos_bucket.vibe_spa_bucket.bucket}.s3.${var.cos_bucket_location}.cloud-object-storage.appdomain.cloud/index.html"
  sensitive   = false
}
