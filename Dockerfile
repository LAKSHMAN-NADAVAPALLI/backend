# Stage 1: Build the Spring Boot app

# Stage 1: Build the Spring Boot app
FROM maven:3.8.5-openjdk-17-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the Spring Boot app
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy the built jar from the previous stage
COPY --from=build /app/target/*.jar app.jar

# Define environment variables (can be overridden at runtime)
ENV SPRING_DATA_MONGODB_URI=${MONGO_URI}
ENV JWT_SECRET=${JWT_SECRET}
ENV SERVER_PORT=8080

# Expose port (default to 8080)
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
