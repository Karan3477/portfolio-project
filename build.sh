#!/bin/bash
set -e

echo "Setting up Maven wrapper permissions..."
chmod +x ./mvnw

echo "Building with Maven..."
./mvnw clean package -DskipTests

echo "Build completed successfully!" 