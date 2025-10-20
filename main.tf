terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "~> 1.46" # choose a supported version
    }
  }
}

resource "ibm_cos_bucket" "sample" {
  name                = var.bucket_name
  cos_instance_id     = ibm_resource_instance.cos.id
  force_destroy       = true
  public_access       = var.make_public
}

resource "ibm_resource_instance" "cos" {
  name              = var.cos_name
  service           = "cloud-object-storage"
  plan              = "standard"
}
