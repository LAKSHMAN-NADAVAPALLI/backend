# Stage 1: Build the Spring Boot app
FROM maven:3.8.5-openjdk-17-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the Spring Boot app
FROM openjdk:17-jdk-slim
WORKDIR /app

ENV MONGO_URI="mongodb+srv://LAKSHMAN:lakshman@cluster0.4unosvn.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
ENV JWT_SECRET="supersecretkeysupersecretkeysupersecretkey!"


COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
