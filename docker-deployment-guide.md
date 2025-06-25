# Docker Deployment Guide for Portfolio Application

This guide explains how to deploy your portfolio application using Docker on Render.

## Prerequisites

- Docker installed on your local machine
- Git repository with your portfolio application
- Render account

## Local Development with Docker

### 1. Build and Run Locally

```bash
# Build the Docker image
docker build -t portfolio-app .

# Run with docker-compose (includes MySQL database)
docker-compose up -d

# Or run standalone (requires external database)
docker run -p 9000:9000 -e SPRING_DATASOURCE_URL=your_db_url portfolio-app
```

### 2. Access the Application

- Frontend: http://localhost:9000
- Backend API: http://localhost:9000/api
- Health Check: http://localhost:9000/actuator/health

### 3. Stop the Application

```bash
# Stop docker-compose services
docker-compose down

# Stop standalone container
docker stop <container_id>
```

## Deployment to Render

### 1. Prepare Your Repository

Ensure your repository contains:
- `Dockerfile` - Multi-stage build for frontend and backend
- `.dockerignore` - Excludes unnecessary files
- `render.yaml` - Render deployment configuration
- `docker-compose.yml` - Local development setup

### 2. Connect to Render

1. Go to [Render Dashboard](https://dashboard.render.com)
2. Click "New +" and select "Blueprint"
3. Connect your GitHub repository
4. Render will automatically detect the `render.yaml` file

### 3. Configure Environment Variables

The `render.yaml` file automatically configures:
- Database connection from the managed MySQL database
- Spring profiles for Docker environment
- Health check endpoint

### 4. Deploy

1. Render will automatically build your Docker image
2. The build process includes:
   - Building Angular frontend
   - Building Spring Boot backend
   - Creating production image
3. The application will be deployed with health checks

### 5. Access Your Deployed Application

- Your application will be available at: `https://your-app-name.onrender.com`
- The database will be automatically provisioned and connected

## Docker Configuration Details

### Multi-Stage Build Process

1. **Frontend Build Stage**: Builds Angular application
2. **Backend Build Stage**: Builds Spring Boot JAR
3. **Production Stage**: Creates lightweight runtime image

### Security Features

- Non-root user execution
- Health checks for monitoring
- Minimal base image (Alpine Linux)
- Proper file permissions

### Environment Configuration

- `application-docker.properties`: Docker-specific configuration
- Environment variables for database connection
- Health check endpoint at `/actuator/health`

## Troubleshooting

### Common Issues

1. **Build Failures**
   ```bash
   # Check build logs
   docker build --progress=plain -t portfolio-app .
   ```

2. **Database Connection Issues**
   - Verify database credentials in Render dashboard
   - Check network connectivity

3. **Health Check Failures**
   - Ensure Spring Boot Actuator is included
   - Verify `/actuator/health` endpoint is accessible

### Logs and Monitoring

```bash
# View application logs
docker logs <container_id>

# Monitor resource usage
docker stats <container_id>
```

## Performance Optimization

### Build Optimization

- Multi-stage builds reduce final image size
- `.dockerignore` excludes unnecessary files
- Layer caching for faster rebuilds

### Runtime Optimization

- JRE-only base image (smaller than JDK)
- Non-root user for security
- Health checks for reliability

## Cost Considerations

- Render's starter plan includes:
  - 750 hours/month of runtime
  - 512MB RAM
  - Shared CPU
  - Free tier database

- Monitor usage in Render dashboard
- Consider upgrading for production workloads

## Next Steps

1. Set up custom domain (optional)
2. Configure SSL certificates (automatic with Render)
3. Set up monitoring and alerts
4. Implement CI/CD pipeline

## Support

- Render Documentation: https://render.com/docs
- Docker Documentation: https://docs.docker.com
- Spring Boot Documentation: https://spring.io/projects/spring-boot 