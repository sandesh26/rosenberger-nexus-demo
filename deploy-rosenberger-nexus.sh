# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Error handler
error_exit() {
    echo -e "${RED}❌ ERROR: $1${NC}"
    echo -e "${RED}Contact SEICHO Technologies for assistance.${NC}"
    exit 1
}

# Success message
success_msg() {
    echo -e "${GREEN}✓ $1${NC}"
}

# Info message
info_msg() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

echo "=========================================="
echo "Starting Rosenberger Nexus Deployment"
echo "=========================================="

# Step 1: Unzip rosenberger.zip
info_msg "Step 1: Extracting rosenberger.zip..."
if [ -f "rosenberger.zip" ]; then
    if unzip -o rosenberger.zip; then
        success_msg "Files extracted and replaced successfully"
    else
        error_exit "Failed to extract rosenberger.zip"
    fi
else
    error_exit "rosenberger.zip file not found in current directory"
fi

# Step 2: Generate Prisma
info_msg "Step 2: Generating Prisma client..."
if npx -y prisma generate; then
    success_msg "Prisma client generated successfully"
else
    error_exit "Failed to generate Prisma client"
fi

# Step 3: Push database changes
info_msg "Step 3: Pushing database schema changes..."
if npx -y prisma db push --skip-generate; then
    success_msg "Database schema pushed successfully"
else
    error_exit "Failed to push database schema changes"
fi

# Step 4: Configure firewall
info_msg "Step 4: Configuring firewall for port 9002..."
if echo "rosenberger" | sudo -S iptables -I INPUT -p tcp --dport 9002 -j ACCEPT; then
    success_msg "Firewall rule added successfully"
else
    error_exit "Failed to configure firewall rule"
fi

# Step 5: Delete existing PM2 process
info_msg "Step 5: Cleaning up existing PM2 process..."
if pm2 delete rosenberger-nexus 2>/dev/null || true; then
    success_msg "Existing process cleaned up"
else
    info_msg "No existing process found (this is normal)"
fi

# Step 6: Flush PM2
info_msg "Step 6: Flushing PM2..."
if pm2 flush; then
    success_msg "PM2 flushed successfully"
else
    error_exit "Failed to flush PM2"
fi

# Step 7: Reload logs
info_msg "Step 7: Reloading PM2 logs..."
if pm2 reloadLogs; then
    success_msg "PM2 logs reloaded successfully"
else
    error_exit "Failed to reload PM2 logs"
fi

# Step 8: Start application
info_msg "Step 8: Starting Rosenberger Nexus application..."
if pm2 start ecosystem.config.js --env production; then
    success_msg "Application started successfully"
else
    error_exit "Failed to start application"
fi

# Step 9: Save PM2 configuration
info_msg "Step 9: Saving PM2 configuration..."
if pm2 save; then
    success_msg "PM2 configuration saved successfully"
else
    error_exit "Failed to save PM2 configuration"
fi

echo "=========================================="
echo -e "${GREEN}✓ Deployment completed successfully!${NC}"
echo "=========================================="