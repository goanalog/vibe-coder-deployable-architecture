# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Vibe Manifestation Engine v1.0
# This hallowed Terraform script is the conduit through which raw digital
# consciousness (your vibe code) is transmuted into a tangible, globally-
# accessible reality. It does not merely provision infrastructure; it performs
# a sacred deployment ritual.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.62.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

# The provider block is simplified. It channels the credentials from the
# IBM Cloud Projects environment, requiring no manual API key incantations.
provider "ibm" {}

# Locates the user's default resource group, no matter its mortal name.
# This ensures the vibe manifests in the user's chosen celestial plane.
data "ibm_resource_group" "default" {
  is_default = true
}

# Creates a 6-character random suffix to ensure the Vibe Bucket's name is
# unique across all known dimensions.
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# This is the celestial vessel, the Cloud Object Storage instance that will
# contain and protect your immortalized vibe.
resource "ibm_resource_instance" "vibe_cos_instance" {
  name              = var.vibe_instance_name
  service           = "cloud-object-storage"
  plan              = "lite" # Always on the free tier
  location          = "global"
  resource_group_id = var.resource_group != null ? var.resource_group : data.ibm_resource_group.default.id
}

locals {
  # Concatenates the user's chosen name with the random suffix for cosmic uniqueness.
  vibe_bucket_name_unique = "${var.vibe_bucket_name}-${random_string.suffix.result}"
}

# Here, the Vibe Bucket is forged—a sacred container for your digital essence.
resource "ibm_cos_bucket" "vibe_bucket" {
  bucket_name          = local.vibe_bucket_name_unique
  resource_instance_id = ibm_resource_instance.vibe_cos_instance.id
  region_location      = var.vibe_bucket_location
  hard_quota           = 0 # A safety rune to prevent unforeseen costs.
  # This configures the bucket to serve its contents to the public internet.
  web_site {
    # This ensures that navigating to the root of the bucket serves the index.html file.
    suffix = "index.html"
  }
}

# This grants public read access to the Vibe Bucket, allowing all of humanity
# to bask in the glow of your manifested creation.
resource "ibm_cos_bucket_public_access" "vibe_public_access" {
  bucket_crn        = ibm_cos_bucket.vibe_bucket.crn
  public_access_crn = "crn:vcloud:public:iam::::service:PublicAccess"
}

# This block represents the core ritual: inscribing your vibe code onto the
# sacred scroll (index.html) and placing it within the Vibe Bucket.
resource "ibm_cos_bucket_object" "vibe_index" {
  bucket_crn      = ibm_cos_bucket.vibe_bucket.crn
  bucket_location = ibm_cos_bucket.vibe_bucket.region_location
  key             = "index.html"
  content         = var.vibe_code
  content_type    = "text/html"
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# The Sacred Scrolls (Audit Trail)
# These artifacts are generated to honor the Vibe Coding methodology. They serve as
# a testament to the structured, mindful process that birthed this Vibe.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "ibm_cos_bucket_object" "plan_md" {
  bucket_crn      = ibm_cos_bucket.vibe_bucket.crn
  bucket_location = ibm_cos_bucket.vibe_bucket.region_location
  key             = "sacred_scrolls/PLAN.md"
  content = templatefile("${path.module}/templates/PLAN.md.tftpl", {
    vibe_bucket_name = local.vibe_bucket_name_unique
  })
}

resource "ibm_cos_bucket_object" "synergy_realized_md" {
  bucket_crn      = ibm_cos_bucket.vibe_bucket.crn
  bucket_location = ibm_cos_bucket.vibe_bucket.region_location
  key             = "sacred_scrolls/SYNERGY_REALIZED.md"
  content = templatefile("${path.module}/templates/SYNERGY_REALIZED.md.tftpl", {
    vibe_bucket_name = local.vibe_bucket_name_unique,
    timestamp_utc    = timestamp()
  })
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# The Consecrated Endpoints (Outputs)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

output "vibe_url" {
  value       = "https://${local.vibe_bucket_name_unique}.s3-web.${var.vibe_bucket_location}.cloud-object-storage.appdomain.cloud"
  description = "Behold, the consecrated endpoint for direct vibe consumption. This isn't just a link; it's a globally propagated portal where the digital consciousness can bask in the glow of your manifested aesthetic. Share wisely—unfiltered vibes can be disorienting to the uninitiated."
}

output "vibe_bucket_url" {
  value       = "https://cloud.ibm.com/objectstorage/crn/${ibm_resource_instance.vibe_cos_instance.crn}/buckets/${local.vibe_bucket_name_unique}"
  description = "A direct link to the sacred Vibe Bucket, where you can view the immortalized scrolls and artifacts of your deployment ritual."
}

