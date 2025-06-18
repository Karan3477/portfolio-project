# FreeSQLDatabase Setup Guide

This guide will help you set up FreeSQLDatabase for your portfolio application.

## Step 1: Create FreeSQLDatabase Account

1. Go to [freesqldatabase.com](https://freesqldatabase.com)
2. Click "Sign Up" and create a free account
3. Verify your email address

## Step 2: Create Database

1. **Login** to your FreeSQLDatabase account
2. **Click "Create Database"**
3. **Configure Database**:
   - **Database Name**: `portfolio_db` (or your preferred name)
   - **Server Location**: Choose the closest to your users
   - **Click "Create"**

## Step 3: Get Connection Details

After database creation, you'll see:
- **Host**: `sql.freesqldatabase.com` (or similar)
- **Database Name**: Your chosen name
- **Username**: Usually your database name
- **Password**: Generated password (save this!)
- **Port**: `3306`

## Step 4: Test Connection Locally (Optional)

You can test the connection locally first:

1. **Update your local `application.properties`**:
```properties
spring.datasource.url=jdbc:mysql://sql.freesqldatabase.com:3306/your_database_name?useSSL=true&allowPublicKeyRetrieval=true&serverTimezone=UTC
spring.datasource.username=your_database_name
spring.datasource.password=your_generated_password
spring.jpa.hibernate.ddl-auto=update
```

2. **Run your application locally** to test the connection

## Step 5: Deploy to Render

### 1. Go to Render Dashboard
- Visit [render.com](https://render.com)
- Sign up/login with your GitHub account

### 2. Create New Web Service
- Click "New +" → "Web Service"
- Connect your GitHub repository
- Select the repository containing your portfolio

### 3. Configure Service
- **Name**: `portfolio-backend`
- **Environment**: `Java`
- **Build Command**: `./mvnw clean package -DskipTests`
- **Start Command**: `java -jar target/Portfolio-0.0.1-SNAPSHOT.jar`

### 4. Set Environment Variables
Add these environment variables in Render:

```
SPRING_PROFILES_ACTIVE=production
SPRING_DATASOURCE_URL=jdbc:mysql://sql.freesqldatabase.com:3306/your_database_name?useSSL=true&allowPublicKeyRetrieval=true&serverTimezone=UTC
SPRING_DATASOURCE_USERNAME=your_database_name
SPRING_DATASOURCE_PASSWORD=your_generated_password
SPRING_JPA_HIBERNATE_DDL_AUTO=update
```

**Replace the placeholders with your actual values:**
- `your_database_name` → Your actual database name
- `your_generated_password` → Your actual password

### 5. Deploy
- Click "Create Web Service"
- Wait for the build to complete
- Note your service URL (e.g., `https://your-backend-name.onrender.com`)

## Step 6: Test Database Connection

After deployment, test your database connection:

1. **Test basic health**: `https://your-backend-name.onrender.com/api/health`
2. **Test database connection**: `https://your-backend-name.onrender.com/api/health/db`

## Step 7: Populate Database

After successful deployment, populate your database:

### Option A: Use data.sql (Automatic)
The `data.sql` file in `src/main/resources/` will automatically populate your database on first startup.

### Option B: Manual Population
Use the API endpoints to create data:

```bash
# Test API endpoints
curl https://your-backend-name.onrender.com/api/about
curl https://your-backend-name.onrender.com/api/projects
curl https://your-backend-name.onrender.com/api/skills
```

## FreeSQLDatabase Limitations

### Free Tier Limits:
- **Storage**: 5MB
- **Connections**: Limited concurrent connections
- **Backup**: Manual backups only
- **Uptime**: 99.9% uptime

### Best Practices:
1. **Optimize your data**: Keep database size under 5MB
2. **Connection pooling**: Already configured in the application
3. **Regular backups**: Export your data periodically
4. **Monitor usage**: Check your database dashboard regularly

## Troubleshooting

### Common Issues:

1. **Connection Timeout**
   - Check if your database is active
   - Verify connection string format
   - Ensure SSL settings are correct

2. **Authentication Failed**
   - Double-check username and password
   - Ensure database name is correct
   - Check if database is created and active

3. **SSL Issues**
   - The configuration already includes SSL settings
   - If issues persist, try `useSSL=false` in connection string

4. **Database Not Found**
   - Verify database name in connection string
   - Check if database was created successfully
   - Ensure you're using the correct host

### Useful Commands:

```bash
# Test basic connectivity
curl https://your-backend-name.onrender.com/api/health

# Test database connection
curl https://your-backend-name.onrender.com/api/health/db

# Test API endpoints
curl https://your-backend-name.onrender.com/api/about
curl https://your-backend-name.onrender.com/api/projects
curl https://your-backend-name.onrender.com/api/skills
```

## Next Steps

After successful database setup and backend deployment:

1. **Deploy frontend on Netlify**
2. **Update CORS configuration**
3. **Test the complete application**
4. **Set up monitoring and alerts**

Your portfolio will be live with a free MySQL database! 🚀 