#!/usr/bin/env bash
set -euo pipefail

# deploy_pm2.sh — build + migrate + start with pm2
# Usage: ./deploy_pm2.sh [PORT]
# Assumptions: node, npm, npx, pm2 and required global deps are already installed.

PORT=${1:-3000}
export PORT

echo "Starting deploy for rosenberger-nexus on port $PORT"

# Verify pm2
if ! command -v pm2 >/dev/null 2>&1; then
  echo "pm2 not found. Install globally: npm install -g pm2" >&2
  exit 1
fi

# Ensure DATABASE_URL is set
if [ -z "${DATABASE_URL:-}" ]; then
  echo "ERROR: DATABASE_URL is not set. Export it before running this script." >&2
  echo "Example: export DATABASE_URL='mysql://rn_user:strong_password@localhost:3306/rosenberger_nexus'" >&2
  exit 1
fi

# Prisma: generate client
echo "-> Running: npx prisma generate"
npx prisma generate

# Prisma: apply migrations (use deploy in production)
echo "-> Running: npx prisma migrate deploy"
npx prisma migrate deploy

# Build Next.js
#echo "-> Running: npm run build"
#npm run build

# Unzip Build Files
unzip .next.zip

# Collect build artifacts into a `build/` directory so they can be archived or inspected.
# We move `.next` and `public` into `build/` and create symlinks so `next start` continues
# to work from the project root.
echo "-> Organizing build artifacts into build/"
BUILD_DIR="$(pwd)/build"
mkdir -p "$BUILD_DIR"

# Move .next
if [ -d ".next" ]; then
  if [ -d "$BUILD_DIR/.next" ]; then
    echo "Removing existing $BUILD_DIR/.next"
    rm -rf "$BUILD_DIR/.next"
  fi
  echo "Moving .next -> $BUILD_DIR/.next"
  mv .next "$BUILD_DIR/.next"
  echo "Creating symlink .next -> $BUILD_DIR/.next"
  ln -sfn "$BUILD_DIR/.next" .next
fi

# Move public (if present)
if [ -d "public" ]; then
  if [ -d "$BUILD_DIR/public" ]; then
    echo "Removing existing $BUILD_DIR/public"
    rm -rf "$BUILD_DIR/public"
  fi
  echo "Moving public -> $BUILD_DIR/public"
  mv public "$BUILD_DIR/public"
  echo "Creating symlink public -> $BUILD_DIR/public"
  ln -sfn "$BUILD_DIR/public" public
fi


# Start / restart via PM2 using ecosystem file
echo "-> Starting app with pm2 (ecosystem.config.js)"
# If already running, reload
if pm2 describe rosenberger-nexus >/dev/null 2>&1; then
  echo "Process already exists — reloading"
  pm2 reload ecosystem.config.js --env production
else
  pm2 start ecosystem.config.js --env production
fi

# Save process list and show status
pm2 save

echo "To enable PM2 startup on reboot run the following command as root (printed below):"
pm2 startup

echo "Deployment complete. Check status with: pm2 status"
echo "View logs: pm2 logs rosenberger-nexus --lines 200"
echo "Verify app: curl -I http://localhost:$PORT/ || open http://localhost:$PORT (on macOS)"
