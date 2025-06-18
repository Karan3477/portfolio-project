# Portfolio Project - Free Hosting Guide

## 🚀 Complete Free Hosting Solution

This guide will help you deploy your portfolio project for FREE using:
- **Frontend**: Netlify (Angular)
- **Backend**: Railway (Spring Boot)
- **Database**: Railway PostgreSQL

---

## 📋 Prerequisites

1. **GitHub Account** (free)
2. **Netlify Account** (free)
3. **Railway Account** (free - $5 credit monthly)

---

## 🎯 Step 1: Prepare Your Project

### 1.1 Update Angular Environment

Create production environment file:

```typescript
// frontend/portfolio-app/src/environments/environment.prod.ts
export const environment = {
  production: true,
  apiUrl: 'https://your-railway-app.up.railway.app/api' // We'll update this later
};
```

### 1.2 Update Angular Service URLs

Update all your services to use the environment API URL:

```typescript
// Example: frontend/portfolio-app/src/app/services/personal-info.service.ts
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class PersonalInfoService {
  private apiUrl = environment.apiUrl + '/personal-info';
  // ... rest of service
}
```

### 1.3 Build Angular for Production

```bash
cd frontend/portfolio-app
ng build --configuration production
```

---

## 🚂 Step 2: Deploy Backend to Railway

### 2.1 Create Railway Account
1. Go to [railway.app](https://railway.app)
2. Sign up with GitHub
3. Get $5 monthly credit (usually enough for small apps)

### 2.2 Deploy Spring Boot App
1. **Connect GitHub Repository**
   - Click "New Project" → "Deploy from GitHub repo"
   - Select your portfolio repository

2. **Add PostgreSQL Database**
   - Click "New" → "Database" → "PostgreSQL"
   - Railway will automatically add environment variables

3. **Configure Environment Variables**
   Add these to your Railway project:
   ```
   SPRING_PROFILES_ACTIVE=prod
   SPRING_DATASOURCE_URL=${DATABASE_URL}
   SPRING_DATASOURCE_USERNAME=${PGUSER}
   SPRING_DATASOURCE_PASSWORD=${PGPASSWORD}
   SPRING_JPA_HIBERNATE_DDL_AUTO=update
   ```

4. **Deploy**
   - Railway will automatically detect Spring Boot
   - Deploy from main branch
   - Get your app URL (e.g., `https://your-app.up.railway.app`)

### 2.3 Update Angular Environment
Update `environment.prod.ts` with your Railway URL:
```typescript
export const environment = {
  production: true,
  apiUrl: 'https://your-app.up.railway.app/api'
};
```

---

## 🌐 Step 3: Deploy Frontend to Netlify

### 3.1 Create Netlify Account
1. Go to [netlify.com](https://netlify.com)
2. Sign up with GitHub

### 3.2 Deploy Angular App
1. **Connect GitHub Repository**
   - Click "New site from Git"
   - Connect your GitHub repository

2. **Configure Build Settings**
   ```
   Build command: cd frontend/portfolio-app && npm install && ng build --configuration production
   Publish directory: frontend/portfolio-app/dist/portfolio-app/browser
   ```

3. **Add Environment Variables**
   ```
   NODE_VERSION: 18
   ```

4. **Deploy**
   - Netlify will build and deploy automatically
   - Get your site URL (e.g., `https://your-portfolio.netlify.app`)

---

## 🔧 Step 4: Configure CORS

Update your Spring Boot CORS configuration:

```java
// src/main/java/com/boot/config/CorsConfig.java
@Configuration
public class CorsConfig {
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOriginPatterns(Arrays.asList(
            "https://*.netlify.app",
            "https://your-portfolio.netlify.app",
            "http://localhost:4200" // for local development
        ));
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        configuration.setAllowCredentials(true);
        
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}
```

---

## 🎨 Step 5: Custom Domain (Optional)

### 5.1 Netlify Custom Domain
1. Go to Site Settings → Domain management
2. Add custom domain
3. Configure DNS records

### 5.2 Railway Custom Domain
1. Go to your Railway project
2. Settings → Domains
3. Add custom domain

---

## 📊 Step 6: Monitor and Maintain

### 6.1 Railway Monitoring
- Check Railway dashboard for usage
- Monitor database connections
- Set up alerts for usage limits

### 6.2 Netlify Analytics
- Enable Netlify Analytics (free tier available)
- Monitor site performance
- Check build status

---

## 💰 Cost Breakdown

### Completely FREE:
- **Netlify**: $0/month (unlimited personal projects)
- **Railway**: $0/month (within $5 credit limit)
- **GitHub**: $0/month (unlimited public repos)

### Total Monthly Cost: $0

---

## 🚨 Important Notes

1. **Railway Limits**: 
   - $5 credit usually lasts for small apps
   - Monitor usage in Railway dashboard
   - Consider upgrading if needed

2. **Database**: 
   - Railway PostgreSQL is included
   - Data persists between deployments
   - Automatic backups

3. **SSL**: 
   - Both Netlify and Railway provide free SSL
   - Automatic HTTPS

4. **Deployments**:
   - Automatic deployments on git push
   - Preview deployments for pull requests

---

## 🔄 Continuous Deployment

Both platforms support automatic deployments:
- Push to `main` branch → Automatic deployment
- Pull requests → Preview deployments
- No manual intervention needed

---

## 📱 Testing Your Deployment

1. **Test Backend**: Visit `https://your-app.up.railway.app/api/personal-info`
2. **Test Frontend**: Visit `https://your-portfolio.netlify.app`
3. **Test Integration**: Check if frontend can fetch data from backend

---

## 🆘 Troubleshooting

### Common Issues:
1. **CORS Errors**: Check CORS configuration
2. **Build Failures**: Check build logs in Netlify
3. **Database Issues**: Check Railway database logs
4. **Environment Variables**: Verify all variables are set

### Support:
- **Netlify**: Excellent documentation and community
- **Railway**: Good documentation and Discord community
- **GitHub**: Extensive documentation and community

---

## 🎉 Success!

Your portfolio is now live and completely free! 🚀

- **Frontend**: `https://your-portfolio.netlify.app`
- **Backend**: `https://your-app.up.railway.app`
- **Database**: Railway PostgreSQL (managed)

Update your resume and LinkedIn with your live portfolio URL! 