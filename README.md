# 🎶 Vibe Coder — Instant Sample Application

Welcome, fellow vibe coder.  
This little project lets you turn a plain HTML file into a **real, hosted web app** — instantly — using **IBM Cloud Object Storage (COS)** and a tiny bit of Terraform magic. ✨

Don’t worry if you’ve never used Terraform or IBM Cloud before.  
You can literally paste or upload your `index.html` and hit **Deploy**, and it just works.

---

## 🚀 What This Does

This Deployable Architecture creates:

- 🪣 A new IBM Cloud Object Storage bucket (your app’s home in the cloud)  
- 🪶 Optional public access, so you can share your app with friends  
- 🧱 An automatic upload of your `index.html` (your app’s main page)  
- 🌐 A friendly URL you can open in your browser right away  

---

## 🧭 How To Use

### Option 1: The Easy Way (IBM Cloud Catalog)

If you’re using this through IBM Cloud’s Private or Community Catalog:
1. Click **Deploy**.
2. Wait a minute or two — grab a coffee or hum a tune. ☕🎵  
3. When it’s done, look for the `web_app_url` output.
4. Click it — that’s your live app!

If you didn’t change anything, it’ll show the included sample page.

---

### Option 2: The Local Way (Run it Yourself)

If you’d rather run it locally:

```bash
git clone https://github.com/goanalog/vibe-coder-deployable-architecture.git
cd vibe-coder-deployable-architecture

# Log into IBM Cloud
ibmcloud login --sso
ibmcloud target -r us-south

# Initialize and deploy
terraform init
terraform apply
