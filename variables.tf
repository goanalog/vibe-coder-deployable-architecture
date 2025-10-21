variable "vibe_bucket_name" {
  description = "🔮 A prefix for your new Vibe Bucket. A random suffix will be added to ensure uniqueness across all known dimensions."
  type        = string
  default     = "vibe-manifestation"
}

variable "vibe_instance_name" {
  description = "✨ A unique name for the Cloud Object Storage instance that will serve as the celestial vessel for your vibe."
  type        = string
  default     = "vibe-vessel-instance"
}

variable "resource_group" {
  description = "🌍 The resource group where your vibe will manifest. If left blank, your account's default resource group will be used."
  type        = string
  default     = null
}

variable "vibe_bucket_location" {
  description = "📍 The geographical region where your vibe will resonate most strongly. This determines the physical location of your Vibe Bucket."
  type        = string
  default     = "us-south"
}

variable "vibe_code" {
  description = "🌀 Channel your app's complete essence here. Pour in the HTML, CSS, and JavaScript—the entire vibe—and our cosmic pipeline will manifest it."
  type        = string
  default     = "<!DOCTYPE html><html><head><title>My Vibe</title><style>body { font-family: sans-serif; background-color: #f0f8ff; color: #333; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; } h1 { font-size: 4rem; text-shadow: 2px 2px 4px #ccc; }</style></head><body><h1>✨ Vibe Manifested! ✨</h1></body></html>"
  sensitive   = true
}

