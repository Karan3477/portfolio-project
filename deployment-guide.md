# Portfolio Deployment Guide

This guide will help you deploy both the frontend (Angular) and backend (Spring Boot) of your portfolio project for free.

## Backend Deployment (Spring Boot) - Render.com

### Step 1: Prepare Backend for Production

1. **Update application-prod.properties** (already exists):
   ```properties
   spring.datasource.url=${SPRING_DATASOURCE_URL}
   spring.datasource.username=${SPRING_DATASOURCE_USERNAME}
   spring.datasource.password=${SPRING_DATASOURCE_PASSWORD}
   spring.jpa.hibernate.ddl-auto=update
   server.port=${PORT:9000}
   ```

2. **Ensure your render.yaml is configured** (already exists):
   ```yaml
   services:
     - type: web
       name: portfolio-backend
       env: java
       buildCommand: ./mvnw clean package -DskipTests
       startCommand: java -jar target/Portfolio-0.0.1-SNAPSHOT.jar
       envVars:
         - key: SPRING_PROFILES_ACTIVE
           value: production
         - key: SPRING_DATASOURCE_URL
           sync: false
         - key: SPRING_DATASOURCE_USERNAME
           sync: false
         - key: SPRING_DATASOURCE_PASSWORD
           sync: false
         - key: SPRING_JPA_HIBERNATE_DDL_AUTO
           value: update
       healthCheckPath: /api/health
   ```

### Step 2: Deploy to Render.com

1. **Sign up/Login to Render.com**
2. **Connect your GitHub repository**
3. **Create a new Web Service**
4. **Configure environment variables**:
   - `SPRING_DATASOURCE_URL`: `jdbc:mysql://sql12.freesqldatabase.com:3306/sql12785476`
   - `SPRING_DATASOURCE_USERNAME`: `sql12785476`
   - `SPRING_DATASOURCE_PASSWORD`: `g1FPIKMc6k`
   - `SPRING_PROFILES_ACTIVE`: `production`
5. **Deploy the service**

### Step 3: Get Backend URL
After deployment, you'll get a URL like: `https://your-backend-name.onrender.com`

---

## Frontend Deployment (Angular) - Netlify

### Step 1: Update Frontend Environment

1. **Update environment.prod.ts**:
   ```typescript
   export const environment = {
     production: true,
     apiUrl: 'https://your-backend-name.onrender.com/api'
   };
   ```

2. **Update environment.ts** (for development):
   ```typescript
   export const environment = {
     production: false,
     apiUrl: 'http://localhost:9000/api'
   };
   ```

### Step 2: Deploy to Netlify

1. **Sign up/Login to Netlify.com**
2. **Connect your GitHub repository**
3. **Configure build settings**:
   - **Build command**: `cd frontend/portfolio-app && npm install && npm run build`
   - **Publish directory**: `frontend/portfolio-app/dist/portfolio-app`
4. **Deploy the site**

### Step 3: Configure Custom Domain (Optional)
- Add your custom domain in Netlify settings
- Update DNS records if needed

---

## Alternative Free Hosting Options

### Backend Alternatives:
1. **Railway.app** - Free tier available
2. **Heroku** - Free tier discontinued, but paid plans available
3. **Google Cloud Run** - Free tier available
4. **AWS Lambda** - Free tier available

### Frontend Alternatives:
1. **Vercel** - Excellent for Angular apps
2. **GitHub Pages** - Free static hosting
3. **Firebase Hosting** - Google's hosting service
4. **Surge.sh** - Simple static hosting

---

## Post-Deployment Checklist

### Backend:
- [ ] Health check endpoint working (`/api/health`)
- [ ] Database connection successful
- [ ] All API endpoints responding
- [ ] CORS configured properly
- [ ] Environment variables set correctly

### Frontend:
- [ ] Build successful
- [ ] API calls working to backend
- [ ] All components loading properly
- [ ] Images and assets loading
- [ ] Responsive design working

### Integration:
- [ ] Frontend can communicate with backend
- [ ] No CORS errors in browser console
- [ ] All features working as expected

---

## Troubleshooting

### Common Issues:

1. **CORS Errors**:
   - Ensure backend CORS configuration allows your frontend domain
   - Update `CorsConfig.java` if needed

2. **Database Connection Issues**:
   - Verify FreeSQLDatabase credentials
   - Check if database is accessible from Render's servers

3. **Build Failures**:
   - Check Node.js version compatibility
   - Ensure all dependencies are in package.json

4. **API 404 Errors**:
   - Verify API endpoints match between frontend and backend
   - Check if backend is running and accessible

### Useful Commands:

```bash
# Test backend locally
./mvnw spring-boot:run

# Test frontend locally
cd frontend/portfolio-app
npm start

# Build frontend for production
cd frontend/portfolio-app
npm run build
```

---

## Security Considerations

1. **Environment Variables**: Never commit sensitive data to Git
2. **CORS**: Configure CORS to only allow your frontend domain
3. **Database**: Use strong passwords and limit database access
4. **HTTPS**: Ensure both frontend and backend use HTTPS in production

---

## Cost Breakdown

- **Backend (Render)**: Free tier available
- **Frontend (Netlify)**: Free tier available
- **Database (FreeSQLDatabase)**: Free tier available
- **Total Cost**: $0/month

Your portfolio will be completely free to host and maintain! 