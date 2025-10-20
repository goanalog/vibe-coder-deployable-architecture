provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

resource "ibm_cos_bucket" "sample_app_bucket" {
  bucket  = var.bucket_name
  crn     = var.cos_crn
  public  = var.make_public
}

resource "ibm_cos_object" "sample_app_html" {
  bucket  = ibm_cos_bucket.sample_app_bucket.bucket
  key     = "index.html"
  content = var.sample_app_html
}
