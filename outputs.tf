output "website_url" {
  description = "URL for the deployed vibe single page app"
  value       = module.static_website.website_endpoint
}
