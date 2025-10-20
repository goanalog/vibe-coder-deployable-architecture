output "bucket_name" {
  value       = ibm_cos_bucket.sample.name
  description = "The IBM COS bucket created for your SPA"
}

output "cos_bucket_url" {
  value       = "https://${ibm_cos_bucket.sample.name}.s3.${var.region}.cloud-object-storage.appdomain.cloud/index.html"
  description = "The public URL for your deployed SPA"
}
