output "bucket_name" {
  description = "The created COS bucket name."
  value       = ibm_cos_bucket.bucket.bucket_name
}

output "app_url" {
  description = "URL of the uploaded sample or user-provided web app."
  value       = "https://${ibm_cos_bucket.bucket.bucket_name}.s3.${var.region}.cloud-object-storage.appdomain.cloud/index.html"
}
