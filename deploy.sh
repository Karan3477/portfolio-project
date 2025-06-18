#!/bin/bash

# Portfolio Deployment Script
# This script helps you build and prepare your portfolio for deployment

echo "🚀 Portfolio Deployment Script"
echo "=============================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

echo ""
echo "📋 Pre-deployment Checklist:"
echo "============================"

# Check if backend directory exists
if [ -d "src" ]; then
    print_status "Backend source code found"
else
    print_error "Backend source code not found"
    exit 1
fi

# Check if frontend directory exists
if [ -d "frontend/portfolio-app" ]; then
    print_status "Frontend source code found"
else
    print_error "Frontend source code not found"
    exit 1
fi

# Check if pom.xml exists
if [ -f "pom.xml" ]; then
    print_status "Maven configuration found"
else
    print_error "Maven configuration not found"
    exit 1
fi

# Check if package.json exists
if [ -f "frontend/portfolio-app/package.json" ]; then
    print_status "Node.js configuration found"
else
    print_error "Node.js configuration not found"
    exit 1
fi

echo ""
echo "🔧 Backend Deployment Steps:"
echo "============================"
echo "1. Push your code to GitHub"
echo "2. Go to https://render.com"
echo "3. Create a new Web Service"
echo "4. Connect your GitHub repository"
echo "5. Configure environment variables:"
echo "   - SPRING_DATASOURCE_URL: jdbc:mysql://sql12.freesqldatabase.com:3306/sql12785476"
echo "   - SPRING_DATASOURCE_USERNAME: sql12785476"
echo "   - SPRING_DATASOURCE_PASSWORD: g1FPIKMc6k"
echo "   - SPRING_PROFILES_ACTIVE: production"
echo "6. Deploy the service"
echo "7. Note your backend URL (e.g., https://your-backend-name.onrender.com)"

echo ""
echo "🎨 Frontend Deployment Steps:"
echo "============================="
echo "1. Update environment.prod.ts with your backend URL"
echo "2. Go to https://netlify.com"
echo "3. Create a new site from Git"
echo "4. Connect your GitHub repository"
echo "5. Configure build settings:"
echo "   - Build command: cd frontend/portfolio-app && npm install && npm run build"
echo "   - Publish directory: frontend/portfolio-app/dist/portfolio-app"
echo "6. Deploy the site"

echo ""
echo "📝 Important Notes:"
echo "=================="
print_warning "Make sure to update the backend URL in environment.prod.ts after backend deployment"
print_warning "Ensure your GitHub repository is public or connected to your deployment platforms"
print_warning "Check that all environment variables are set correctly in Render"

echo ""
echo "🔍 Post-deployment Testing:"
echo "=========================="
echo "1. Test backend health: curl https://your-backend-name.onrender.com/api/health"
echo "2. Test API endpoints: curl https://your-backend-name.onrender.com/api/about"
echo "3. Check frontend loads correctly"
echo "4. Test all features (About, Projects, Skills, Contact, Resume)"

echo ""
print_status "Deployment guide ready! Follow the steps above to deploy your portfolio."
echo ""
echo "📚 Additional Resources:"
echo "======================="
echo "- Deployment Guide: deployment-guide.md"
echo "- FreeSQLDatabase Setup: freesqldatabase-setup.md"
echo "- Frontend Setup: frontend-setup.md" 