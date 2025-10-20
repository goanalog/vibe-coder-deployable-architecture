output "bucket_name" {
  value       = ibm_cos_bucket.bucket.name
  description = "The COS bucket hosting the sample app."
}

output "app_url" {
  value       = "https://${ibm_cos_bucket.bucket.name}.s3.${var.region}.cloud-object-storage.appdomain.cloud/index.html"
  description = "URL for accessing the sample app."
}
