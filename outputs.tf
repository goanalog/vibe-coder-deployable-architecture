output "bucket_name" {
  value = ibm_cos_bucket.sample_app_bucket.bucket
}

output "app_url" {
  value = "https://${ibm_cos_bucket.sample_app_bucket.bucket}.s3.${var.region}.cloud-object-storage.appdomain.cloud/index.html"
}
