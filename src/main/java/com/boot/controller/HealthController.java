package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class HealthController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/health")
    public String health() {
        return "OK";
    }

    @GetMapping("/health/db")
    public Map<String, Object> databaseHealth() {
        Map<String, Object> response = new HashMap<>();
        
        try {
            // Test database connection
            String result = jdbcTemplate.queryForObject("SELECT 1", String.class);
            response.put("status", "OK");
            response.put("database", "Connected");
            response.put("timestamp", System.currentTimeMillis());
        } catch (Exception e) {
            response.put("status", "ERROR");
            response.put("database", "Connection failed");
            response.put("error", e.getMessage());
            response.put("timestamp", System.currentTimeMillis());
        }
        
        return response;
    }
} 