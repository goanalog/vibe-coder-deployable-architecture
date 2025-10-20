resource "ibm_resource_instance" "cos" {
  name     = var.cos_name
  service  = "cloud-object-storage"
  plan     = "standard"
}

resource "ibm_cos_bucket" "sample" {
  bucket_name         = var.bucket_name
  resource_instance_id = ibm_resource_instance.cos.id
  public_access       = var.make_public
}
