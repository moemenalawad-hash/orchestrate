# Railway.app Deployment Guide

## Quick Deployment (3 Steps!)

### Step 1: Push to GitHub

```bash
# Add all new files
git add .

# Commit changes
git commit -m "Add Railway deployment configuration"

# Push to your repository
git push -u origin main
```

### Step 2: Deploy on Railway

1. **Go to [railway.app](https://railway.app)**
2. **Click "Start a New Project"**
3. **Select "Deploy from GitHub repo"**
4. **Connect your GitHub account** (if not already connected)
5. **Select your repository**: `moemenalawad-hash/orchestrate`
6. **Click "Deploy Now"**

That's it! Railway will automatically:
- Detect it's a Python project
- Install dependencies from `requirements.txt`
- Use Python 3.12 (configured in `nixpacks.toml`)
- Start your FastAPI server
- Generate a public URL

### Step 3: Get Your URL

After deployment (takes 2-3 minutes):
1. Click on your project in Railway dashboard
2. Go to **"Settings"** tab
3. Click **"Generate Domain"** under "Networking"
4. You'll get a URL like: `https://orchestrate.up.railway.app`

## Access Your API

Once deployed, you can access:

- **API Root**: `https://orchestrate.up.railway.app/`
- **Swagger UI**: `https://orchestrate.up.railway.app/docs`
- **ReDoc**: `https://orchestrate.up.railway.app/redoc`
- **MCP Server**: `https://orchestrate.up.railway.app/mcp`

## Update OpenAPI Server URL

After getting your Railway URL, update your OpenAPI specification:

```json
"servers": [
  {
    "url": "https://orchestrate.up.railway.app",
    "description": "Production server"
  }
]
```

## Railway Free Tier

- **$5 free credit per month**
- **500 hours of usage**
- **No credit card required initially**
- **Auto-deploys on git push**
- **Persistent storage available**

## Configuration Files

Railway uses these files for deployment:

1. **`railway.json`** - Railway-specific configuration
2. **`nixpacks.toml`** - Build configuration (Python 3.12)
3. **`requirements.txt`** - Python dependencies

## Auto-Deploy

Railway automatically redeploys when you push to GitHub:

```bash
git add .
git commit -m "Update feature"
git push origin main
# Railway automatically deploys!
```

## Monitoring

Railway provides:
- **Real-time logs** - See your app's output
- **Metrics** - CPU, memory, network usage
- **Deployment history** - Rollback if needed

## Troubleshooting

### Deployment fails?
- Check the build logs in Railway dashboard
- Verify `requirements.txt` is correct
- Ensure `nixpacks.toml` specifies Python 3.12

### App not responding?
- Check the deployment logs
- Verify the start command in `railway.json`
- Make sure your app binds to `0.0.0.0:$PORT`

## Support

- Railway Docs: https://docs.railway.app
- Railway Discord: https://discord.gg/railway

---

**Ready to deploy?** Just push to GitHub and follow Step 2 above! 🚀