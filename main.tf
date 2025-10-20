terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "~> 1.46" # choose a supported version
    }
  }
}

resource "ibm_resource_instance" "cos" {
  name      = var.cos_name
  service   = "cloud-object-storage"
  plan      = "standard"
  location  = var.region    # <-- add this
}

resource "ibm_cos_bucket" "sample" {
  bucket      = var.bucket_name        # <-- changed from 'name'
  instance_id = ibm_resource_instance.cos.id  # <-- changed from 'cos_instance_id'
  force_destroy = true
  public_access = var.make_public ? "true" : "false"   # <-- string expected
}
