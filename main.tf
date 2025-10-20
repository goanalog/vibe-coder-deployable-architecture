resource "ibm_resource_instance" "cos" {
  name       = var.cos_name
  service    = "cloud-object-storage"
  plan       = "standard"
  resource_group_id = data.ibm_resource_group.default.id
}

resource "ibm_cos_bucket" "sample" {
  bucket        = var.bucket_name
  cos_instance  = ibm_resource_instance.cos.id
  public_access = var.make_public
}

resource "local_file" "sample_html" {
  content  = var.sample_app_html
  filename = "${path.module}/sample-app-output.html"
}

output "bucket_name" {
  value = ibm_cos_bucket.sample.bucket
}

output "app_url" {
  value = "https://${var.bucket_name}.s3.${var.region}.cloud-object-storage.appdomain.cloud/index.html"
}
