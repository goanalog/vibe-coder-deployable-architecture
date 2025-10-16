# ------------------------------------------------------------
# COS Bucket Details
# ------------------------------------------------------------

output "cos_bucket_name" {
  description = <<EOT
The name of the IBM Cloud Object Storage bucket that was created to host your sample application.
You can use this name to reference the bucket in IBM Cloud or in other Terraform modules.
EOT
  value = ibm_resource_instance.cos_bucket.name
}

output "cos_bucket_id" {
  description = <<EOT
The unique identifier (CRN) of the IBM Cloud Object Storage bucket.
Useful for advanced configurations, access policies, or cross-service integrations.
EOT
  value = ibm_resource_instance.cos_bucket.id
}

# ------------------------------------------------------------
# Sample Application Access Information
# ------------------------------------------------------------

output "sample_app_url" {
  description = <<EOT
The publicly accessible URL of your sample application deployed to IBM Cloud Object Storage.
Use this URL to open your sample application in a browser or to share it with others.
If 'make_public' was set to false, this URL will not be publicly accessible.
EOT
  value = "https://${ibm_resource_instance.cos_bucket.name}.s3.${var.cloud_region}.cloud-object-storage.appdomain.cloud/index.html"
}

output "html_file_path_used" {
  description = <<EOT
The file path of the HTML file that was deployed as your sample application.
By default, this is 'sample-index.html', but if you replaced it before deployment, this will reflect the custom file used.
EOT
  value = var.html_file_path
}
