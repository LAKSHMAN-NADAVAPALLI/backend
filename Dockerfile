# Dockerfile
# Use official OpenJDK 17 runtime as base image
FROM openjdk:17-jdk-slim

# Set working directory in the container
WORKDIR /app

# Copy the built JAR file from your target directory into the container
COPY target/app.jar app.jar

# Expose the port your Spring Boot app runs on
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
