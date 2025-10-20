# --- Required Providers ---
# Defines the Terraform providers needed for this configuration.

terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.54.0" # Matches the version from your logs
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

# --- Configuration ---

# Add a random suffix to the bucket name to ensure it is globally unique.
resource "random_id" "suffix" {
  byte_length = 4
}

# Look up the details of the resource group provided by the user.
data "ibm_resource_group" "group" {
  name = var.resource_group_name
}

# This creates the "lite" plan Cloud Object Storage service instance.
resource "ibm_resource_instance" "cos" {
  name              = var.cos_instance_name
  service           = "cloud-object-storage"
  plan              = "lite"
  location          = "global"
  resource_group_id = data.ibm_resource_group.group.id
}

# This creates the storage bucket within the COS instance.
resource "ibm_cos_bucket" "sample" {
  bucket_name          = "${var.bucket_name_prefix}-${random_id.suffix.hex}"
  resource_instance_id = ibm_resource_instance.cos.id
  region_location      = var.region
  endpoint_type        = "public"
  force_delete         = true # Allows the bucket to be deleted even if not empty
}

# This uploads a sample index.html file to the bucket.
resource "ibm_cos_bucket_object" "html_spa" {
  bucket_crn      = ibm_cos_bucket.sample.crn
  bucket_location = ibm_cos_bucket.sample.region_location
  key             = "index.html"
  content         = "<h1>Welcome to Vibe Coder!</h1><p>Your instant SPA is live.</p>"
  endpoint_type   = "public"
  force_delete    = true
}

# --- FIX ---
# This policy grants "Content Reader" access to the "PublicAccess" group,
# making your bucket's objects readable by anyone on the internet.
# It correctly targets the specific bucket and COS instance created above.
resource "ibm_iam_access_group_policy" "public_access_policy" {
  # This correctly sets the group to "PublicAccess"
  access_group_id = "PublicAccess"

  roles = ["Content Reader"]

  # This block correctly targets the policy to your new bucket.
  # This was the source of the previous errors.
  resources {
    service              = "cloud-object-storage"
    resource_instance_id = ibm_resource_instance.cos.id
    resource_type        = "bucket"
    resource             = ibm_cos_bucket.sample.bucket_name
  }

  # This ensures the bucket is created before this policy is applied.
  depends_on = [
    ibm_cos_bucket.sample
  ]
}

# --- CLICKABLE OUTPUT ---
#
# This creates the key output for your deployable architecture.
# It builds the public URL from the bucket's public endpoint and the object's key.
#
output "application_url" {
  description = "The public URL for the sample application."
  value       = "https://${ibm_cos_bucket.sample.s3_endpoint_public}/${ibm_cos_bucket_object.html_spa.key}"
}
