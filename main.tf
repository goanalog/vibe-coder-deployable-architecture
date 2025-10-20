required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm" // <-- This is the correct source
      version = ">= 1.54.0"     // Use your required version
    }
  }
}

resource "ibm_resource_instance" "cos" {
  name            = var.cos_instance_name
  service         = "cloud-object-storage"
  plan            = "standard"
}

resource "ibm_cos_bucket" "sample" {
  name                 = var.bucket_name
  resource_instance_id = ibm_resource_instance.cos.id
  force_destroy        = true
  public_access        = var.make_public ? "true" : "false"
}

resource "ibm_cos_object" "html_spa" {
  bucket = ibm_cos_bucket.sample.name
  key    = "index.html"
  content = var.html_content
  content_type = "text/html"
}
