package com.cybersecurity.backend;



import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

@SpringBootApplication

@EnableMongoRepositories(basePackages = "com.cybersecurity.backend")
public class BackendApplication {
    public static void main(String[] args) {
    	System.out.println("MongoDB URI: " + System.getenv("MONGO_URI"));
        SpringApplication.run(BackendApplication.class, args);
    }

	
	
}
