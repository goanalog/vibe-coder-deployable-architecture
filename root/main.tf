terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.58.0"
    }
  }
}

provider "ibm" {
  region = var.region
}

# Use the terraform-ibm-static-website module or your local implementation.
# If you vendor in the module, change the source accordingly.
module "static_website" {
  source             = "github.com/terraform-ibm-modules/terraform-ibm-static-website"
  region             = var.region
  bucket_name_prefix = var.bucket_name_prefix
  website_dir        = "generated"
}

# Ensure the generated folder exists and write the active SPA to disk
resource "local_file" "app_index" {
  content  = local.app_source
  filename = "${path.module}/generated/${var.object_key}"
}

# Upload the file to COS (module must create the bucket)
resource "ibm_cos_bucket_object" "app_object" {
  bucket        = module.static_website.bucket_name
  key           = var.object_key
  content       = local.app_source
  content_type  = "text/html"
  etag          = md5(local.app_source)
  depends_on    = [module.static_website]
}
