provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

resource "ibm_cos_bucket" "sample_app_bucket" {
  name       = var.bucket_name
  cos_instance = var.cos_name
  public     = var.make_public
}

resource "local_file" "sample_app_file" {
  content  = var.sample_app_html
  filename = "${path.module}/index.html"
}

resource "ibm_cos_object" "sample_app_html" {
  bucket       = ibm_cos_bucket.sample_app_bucket.name
  key          = "index.html"
  source       = local_file.sample_app_file.filename
  content_type = "text/html"
}
