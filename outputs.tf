output "bucket_name" {
  value = ibm_cos_bucket.bucket.bucket
}

output "app_url" {
  value = "https://${ibm_cos_bucket.bucket.bucket}.s3.${var.region}.cloud-object-storage.appdomain.cloud/index.html"
}
