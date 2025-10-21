output "spa_url" {
  value       = "https://${var.cos_bucket_name}.s3.${var.cos_region}.cloud-object-storage.appdomain.cloud/index.html"
  description = "URL to access your deployed SPA."
}
