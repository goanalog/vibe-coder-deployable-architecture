provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.location
}

resource "ibm_cos_bucket" "spa_bucket" {
  bucket = "vibe-coder-sample-bucket"
  location = var.location
  force_destroy = true
}

# Generate the full SPA HTML using a template
data "template_file" "spa_html" {
  template = file("${path.module}/spa.tpl.html")
  vars = {
    vibe_code = var.vibe_code
  }
}

resource "ibm_cos_bucket_object" "html_spa" {
  bucket       = ibm_cos_bucket.spa_bucket.name
  key          = "index.html"
  content      = data.template_file.spa_html.rendered
  content_type = "text/html"
  acl          = var.make_public ? "public-read" : "private"
}
