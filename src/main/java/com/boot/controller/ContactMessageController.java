package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.boot.model.ContactMessage;
import com.boot.dao.ContactMessageRepository;
import java.util.List;

@RestController
@RequestMapping("/api/contact-messages")
@CrossOrigin(origins = "http://localhost:4200")
public class ContactMessageController {

    @Autowired
    private ContactMessageRepository contactMessageRepository;

    @GetMapping
    public List<ContactMessage> getAllContactMessages() {
        return contactMessageRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<ContactMessage> getContactMessageById(@PathVariable Long id) {
        return contactMessageRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ContactMessage createContactMessage(@RequestBody ContactMessage contactMessage) {
        return contactMessageRepository.save(contactMessage);
    }

    @GetMapping("/recent")
    public List<ContactMessage> getRecentMessages() {
        return contactMessageRepository.findTop10ByOrderByCreatedAtDesc();
    }

    @GetMapping("/by-email/{email}")
    public List<ContactMessage> getMessagesByEmail(@PathVariable String email) {
        return contactMessageRepository.findByEmailOrderByCreatedAtDesc(email);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteContactMessage(@PathVariable Long id) {
        return contactMessageRepository.findById(id)
                .map(contactMessage -> {
                    contactMessageRepository.delete(contactMessage);
                    return ResponseEntity.ok().build();
                })
                .orElse(ResponseEntity.notFound().build());
    }
} 