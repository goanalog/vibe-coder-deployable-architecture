# --- Assumed Variables ---
# (You likely have these defined in variables.tf)

variable "resource_group_name" {
  type    = string
  default = "default" # Adjust this if your resource group is not named "default"
}
variable "bucket_name_prefix" {
  type    = string
  default = "vibe-coder-sample-bucket"
}
variable "cos_instance_name" {
  type    = string
  default = "vibe-coder-cos"
}
variable "region" {
  type    = string
  default = "us-south" # Your log showed "us-south"
}

# --- Required Providers ---

terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.54.0" # From your log
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

# --- Configuration ---

# Add a random suffix to the bucket name to make it unique
resource "random_id" "suffix" {
  byte_length = 4
}

data "ibm_resource_group" "group" {
  name = var.resource_group_name
}

# This creates the "lite" COS service instance
resource "ibm_resource_instance" "cos" {
  name              = var.cos_instance_name
  service           = "cloud-object-storage"
  plan              = "lite"
  location          = "global"
  resource_group_id = data.ibm_resource_group.group.id
}

# This creates the bucket within the COS instance
resource "ibm_cos_bucket" "sample" {
  bucket_name          = "${var.bucket_name_prefix}-${random_id.suffix.hex}"
  resource_instance_id = ibm_resource_instance.cos.id
  region_location      = var.region
  endpoint_type        = "public"
  force_delete         = true
}

# This uploads your sample index.html file
resource "ibm_cos_bucket_object" "html_spa" {
  bucket_crn      = ibm_cos_bucket.sample.crn
  bucket_location = ibm_cos_bucket.sample.region_location
  key             = "index.html"
  content_type    = "text/html" # Good practice to add this
  content         = "<h1>Welcome to Vibe Coder!</h1><p>Your instant SPA is live.</p>"
  endpoint_type   = "public"
  force_delete    = true
}

#
# --- THIS IS THE FIX ---
#
# 1. I removed the 'data "ibm_iam_access_group" "public_access_group"' block.
# 2. I removed the failing 'resource "ibm_iam_access_group_policy" "public_access_policy"' block.
# 3. I added this single resource, which is the correct way
#    to make a COS bucket public.
#
resource "ibm_cos_bucket_public_access" "public_access" {
  bucket_crn    = ibm_cos_bucket.sample.crn
  public_access = "reader" # Grants "Content Reader" and "Object Reader"
  
  # This ensures the bucket is created before this rule is applied
  depends_on = [
    ibm_cos_bucket.sample
  ]
}

#
# --- CLICKABLE OUTPUT ---
#
# As we discussed earlier, this creates the key output.
# It builds the public URL from the bucket's public endpoint and the object's key.
#
output "application_url" {
  description = "The public URL for the sample application."
  value       = "https://${ibm_cos_bucket.sample.s3_endpoint_public}/${ibm_cos_bucket_object.html_spa.key}"
}