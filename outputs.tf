output "bucket_name" {
  description = "COS bucket name"
  value       = ibm_cos_bucket.sample.bucket
}

output "app_url" {
  description = "URL to access the sample app"
  value       = "https://${var.bucket_name}.s3.${var.region}.cloud-object-storage.appdomain.cloud/index.html"
}
