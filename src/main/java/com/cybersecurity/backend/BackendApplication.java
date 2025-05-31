package com.cybersecurity.backend;



import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;


@SpringBootApplication
@EnableMongoRepositories(basePackages = "com.cybersecurity.backend")
public class BackendApplication {
    public static void main(String[] args) {
        String mongoUri = System.getenv("MONGO_URI");
        System.out.println("MongoDB URI: " + (mongoUri != null ? mongoUri : "MONGO_URI is not set"));
        if (mongoUri != null && !mongoUri.startsWith("mongodb://") && !mongoUri.startsWith("mongodb+srv://")) {
            System.out.println("Invalid MongoDB URI: Must start with mongodb:// or mongodb+srv://");
        }
        SpringApplication.run(BackendApplication.class, args);
    }
}
