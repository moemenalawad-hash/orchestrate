# Deployment Guide - Render.com

## Quick Deployment Steps

### 1. Push Your Code to GitHub

First, initialize a git repository and push to GitHub:

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit - Galaxium Booking System"

# Create a new repository on GitHub, then:
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git branch -M main
git push -u origin main
```

### 2. Deploy on Render.com

1. **Go to [Render.com](https://render.com)** and sign up (free, no credit card required)

2. **Click "New +" → "Web Service"**

3. **Connect your GitHub repository**
   - Authorize Render to access your GitHub
   - Select your repository

4. **Configure the service:**
   - **Name**: `galaxium-booking-system` (or any name you prefer)
   - **Environment**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `uvicorn server:app --host 0.0.0.0 --port $PORT`
   - **Plan**: Select **Free**

5. **Add Environment Variable:**
   - Click "Advanced"
   - Add: `PYTHON_VERSION` = `3.12.0`

6. **Click "Create Web Service"**

### 3. Wait for Deployment

- Render will automatically build and deploy your app
- This takes 2-5 minutes
- You'll get a URL like: `https://galaxium-booking-system.onrender.com`

### 4. Update Your OpenAPI Server URL

Once deployed, update your OpenAPI specification with the actual server URL:

```json
"servers": [
  {
    "url": "https://your-app-name.onrender.com",
    "description": "Production server"
  }
]
```

### 5. Access Your API

- **API Root**: `https://your-app-name.onrender.com/`
- **Swagger UI**: `https://your-app-name.onrender.com/docs`
- **ReDoc**: `https://your-app-name.onrender.com/redoc`
- **MCP Server**: `https://your-app-name.onrender.com/mcp`

## Important Notes

### Free Tier Limitations
- **Spins down after 15 minutes of inactivity**
- First request after spin-down takes 30-60 seconds
- 750 hours/month free (enough for testing)

### Database Persistence
- The SQLite database (`booking.db`) will reset on each deployment
- For persistent data, consider upgrading to Render's PostgreSQL (also has free tier)

### Auto-Deploy
- Render automatically redeploys when you push to GitHub
- No manual deployment needed after initial setup

## Troubleshooting

### If deployment fails:
1. Check the build logs in Render dashboard
2. Verify `requirements.txt` has all dependencies
3. Ensure Python version is set to 3.12.0

### If app doesn't start:
1. Check the service logs in Render dashboard
2. Verify the start command is correct
3. Make sure port binding uses `$PORT` environment variable

## Alternative: Manual Deployment (Without GitHub)

If you don't want to use GitHub:

1. Go to Render.com
2. Click "New +" → "Web Service"
3. Choose "Deploy from Git" → "Public Git repository"
4. Enter your repository URL
5. Follow steps 4-6 above

## Need Help?

- Render Documentation: https://render.com/docs
- FastAPI Deployment: https://fastapi.tiangolo.com/deployment/