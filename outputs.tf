# ------------------------------------------------------------
# cos bucket details
# ------------------------------------------------------------

output "cos_bucket_name" {
  description = <<EOT
This is the name of your free vibe code bucket—where your sample app lives and serves your users.
Use this name to reference your bucket in IBM Cloud or in other Terraform modules.
EOT
  value = ibm_resource_instance.cos_bucket.name
}

output "cos_bucket_id" {
  description = <<EOT
The unique ID (CRN) of your vibe code bucket.
Handy for advanced tweaks, access policies, or integrations with other services.
EOT
  value = ibm_resource_instance.cos_bucket.id
}

# ------------------------------------------------------------
# sample application access information
# ------------------------------------------------------------

output "sample_app_url" {
  description = <<EOT
Here’s the public URL of your deployed sample app—your vibes are live!
Open it in a browser, share it with others, or use it as a starting point for your next code drop.
If you set 'public_access' to false, this URL won’t be publicly reachable.
EOT
  value = "https://${ibm_resource_instance.cos_bucket.name}.s3.${var.cos_region}.cloud-object-storage.appdomain.cloud/index.html"
}

output "html_file_path_used" {
  description = <<EOT
The path of the HTML file that was deployed as your sample app.
By default, this is 'sample-index.html', but if you pasted your own vibe code, this reflects your custom file.
EOT
  value = var.index_html_path
}
