resource "ibm_cos_bucket" "sample" {
  bucket = var.bucket_name
  cos_instance = ibm_resource_instance.cos.id
  public_access = var.make_public
}

resource "local_file" "sample_html" {
  content  = var.sample_app_html
  filename = "${path.module}/sample-app-output.html"
}

