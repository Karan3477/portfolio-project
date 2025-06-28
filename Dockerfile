# Multi-stage build for Portfolio Application
# Stage 1: Build Angular Frontend
FROM node:18-alpine AS frontend-build

# Set working directory
WORKDIR /app

# Copy package files first
COPY frontend/portfolio-app/package*.json ./portfolio-app/

# Navigate to the portfolio-app directory
WORKDIR /app/portfolio-app

# Install the exact Angular CLI version from package.json
RUN npm install

# Copy the rest of the source code
COPY frontend/portfolio-app/ .

# Debug: Show Angular CLI version and available scripts
RUN npx ng version
RUN npm run

# Increase memory for the build and set production mode
ENV NODE_OPTIONS=--max-old-space-size=4096
ENV NODE_ENV=production

# Build the Angular application for production
RUN npx ng build --configuration production

# Stage 2: Build Spring Boot Backend
FROM maven:3.9-eclipse-temurin-17 AS backend-build

WORKDIR /app/backend

# Copy pom.xml and download dependencies
COPY pom.xml ./
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the Spring Boot application
RUN mvn clean package -DskipTests

# Stage 3: Production Runtime
FROM docker.io/eclipse-temurin:17-jre-alpine

# Install necessary packages
RUN apk add --no-cache curl

# Create app directory
WORKDIR /app

# Copy the built JAR from backend build stage
COPY --from=backend-build /app/backend/target/*.jar app.jar

# Copy the built frontend from frontend build stage
COPY --from=frontend-build /app/portfolio-app/dist/portfolio-app/browser ./static

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