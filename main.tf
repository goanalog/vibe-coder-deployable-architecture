provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.location
}

resource "ibm_resource_group" "vibe_group" {
  name = "Vibe-Coder-RG"
}

resource "ibm_cos_bucket" "spa_bucket" {
  name          = "vibe-coder-spa-bucket"
  location      = var.location
  resource_group = ibm_resource_group.vibe_group.id
  force_destroy = true
  public_access = var.make_public ? "public-read" : "private"
}

resource "ibm_cos_bucket_object" "html_spa" {
  bucket       = ibm_cos_bucket.spa_bucket.name
  key          = "index.html"
  source       = "${path.module}/default.html"
  content_type = "text/html"
}
