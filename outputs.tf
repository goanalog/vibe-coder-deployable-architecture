output "bucket_name" {
  description = "The name of the COS bucket."
  value       = ibm_cos_bucket.sample.bucket_name
}

output "bucket_endpoint" {
  description = "The public endpoint of the COS bucket."
  value       = ibm_cos_bucket.sample.endpoint
}
