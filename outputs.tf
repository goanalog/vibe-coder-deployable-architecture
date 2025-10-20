output "bucket_name" {
  description = "Name of the COS bucket hosting the sample app"
  value       = var.bucket_name
}

output "app_url" {
  description = "Public URL of the sample app"
  value       = "https://${var.bucket_name}.s3.${var.region}.cloud-object-storage.appdomain.cloud/index.html"
}
