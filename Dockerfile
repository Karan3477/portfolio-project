# Multi-stage build for Portfolio Application
# Stage 1: Build Angular Frontend
FROM node:18-alpine AS frontend-build

WORKDIR /app/frontend

# Copy package files
COPY frontend/portfolio-app/package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy source code
COPY frontend/portfolio-app/ ./

# Build the Angular application
RUN npm run build

# Stage 2: Build Spring Boot Backend
FROM maven:3.9.6-openjdk-17 AS backend-build

WORKDIR /app/backend

# Copy pom.xml and download dependencies
COPY pom.xml ./
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the Spring Boot application
RUN mvn clean package -DskipTests

# Stage 3: Production Runtime
FROM openjdk:17-jre-alpine

# Install necessary packages
RUN apk add --no-cache curl

# Create app directory
WORKDIR /app

# Copy the built JAR from backend build stage
COPY --from=backend-build /app/backend/target/*.jar app.jar

# Copy the built frontend from frontend build stage
COPY --from=frontend-build /app/frontend/dist/portfolio-app/browser ./static

# Create a non-root user
RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup

# Change ownership of the app directory
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 9000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:9000/actuator/health || exit 1

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"] 