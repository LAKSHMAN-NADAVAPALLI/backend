# Stage 1: Build the Spring Boot app
FROM maven:3.8.5-openjdk-17-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the Spring Boot app
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

ENV SPRING_DATA_MONGODB_URI=${MONGO_URI}
ENV JWT_SECRET=${JWT_SECRET}


EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]