output "bucket_name" {
  description = "Name of the COS bucket"
  value       = ibm_cos_bucket.bucket.bucket_name
}

output "app_url" {
  description = "Public URL for the index.html file"
  value       = "https://${ibm_cos_bucket.bucket.bucket_name}.s3.${var.region}.cloud-object-storage.appdomain.cloud/index.html"
}

output "resource_key_crn" {
  description = "CRN of the resource key for COS"
  value       = ibm_resource_key.cos_key.crn
}
