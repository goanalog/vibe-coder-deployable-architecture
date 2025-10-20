resource "ibm_cos_bucket" "sample" {
  name                 = var.bucket_name
  resource_instance_id = ibm_resource_instance.cos.id
  acl                  = var.make_public ? "public-read" : "private"
  location             = var.region
}

resource "local_file" "sample_html" {
  content  = var.sample_app_html
  filename = "${path.module}/sample-app-output.html"
}
