output "cos_bucket_name" {
  description = "The name of the COS bucket hosting the SPA."
  value       = ibm_cos_bucket.vibe_spa_bucket.name
}

output "spa_url" {
  description = "URL of the deployed SPA index.html. This is the key output for the catalog."
  value       = "https://${ibm_cos_bucket.vibe_spa_bucket.name}.s3.${var.cos_bucket_location}.cloud-object-storage.appdomain.cloud/index.html"
  sensitive   = false
  # Marking as a key output for catalog usage
  # In IBM Cloud Catalog, the first output in the outputs array usually becomes the primary output.
}
