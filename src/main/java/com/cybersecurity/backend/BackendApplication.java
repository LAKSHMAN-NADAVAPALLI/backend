package com.cybersecurity.backend;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import jakarta.annotation.PostConstruct;

@SpringBootApplication
@EnableMongoRepositories(basePackages = "com.cybersecurity.backend")
public class BackendApplication {

    // ✅ Must not be static
    @Value("${spring.data.mongodb.uri:Not Configured}")
    private String springMongoUri;

    public static void main(String[] args) {
        SpringApplication.run(BackendApplication.class, args);
    }

    @PostConstruct
    public void printMongoUri() {
        System.out.println("✅ Spring MongoDB URI: " + springMongoUri);
    }
}
