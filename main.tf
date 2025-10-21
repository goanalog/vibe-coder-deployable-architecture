provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.location
}

resource "ibm_resource_group" "default" {
  name = "vibe-coder-rg"
}

resource "ibm_cos_bucket" "spa_bucket" {
  name            = "vibe-coder-spa-bucket"
  location        = var.location
  resource_group  = ibm_resource_group.default.id
  force_destroy   = true
  public_access   = var.make_public
}

resource "ibm_cos_bucket_object" "html_spa" {
  bucket       = ibm_cos_bucket.spa_bucket.name
  key          = "index.html"
  content      = var.vibe_code
  content_type = "text/html"
}
