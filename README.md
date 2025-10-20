# Vibe Coder — Instant COS SPA

Welcome to **Vibe Coder**, your instant IBM Cloud Object Storage single-page app deployer!  

This deployable architecture lets you:

- Paste or upload HTML content for a sample app.
- Automatically create a COS instance and bucket (or use an existing one).
- Optionally make your bucket public for instant access.
- Everything is deployable from IBM Cloud Catalog in a few clicks.

## Inputs

- `ibmcloud_api_key`: Your IBM Cloud API key (secure).
- `region`: IBM Cloud region (default: `us-south`).
- `resource_group_id`: Resource group where your COS instance will live.
- `cos_name`: Name for the COS instance (default: `vibe-coder-cos`).
- `bucket_name`: Name of the COS bucket (default: `vibe-coder-sample-bucket`).
- `make_public`: Make the bucket publicly accessible? (default: false).
- `sample_app_html`: HTML content for your sample SPA.
- `existing_cos_id`: Optional: Use an existing COS instance instead of creating a new one.

Deploy, wait a minute, and your HTML SPA is live on IBM Cloud Object Storage. Don’t worry — the Catalog will prompt for all inputs clearly.

Enjoy coding the vibes! 🎵✨
