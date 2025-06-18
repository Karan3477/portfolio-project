package com.boot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.boot.model.ContactMessage;
import java.util.List;

@Repository
public interface ContactMessageRepository extends JpaRepository<ContactMessage, Long> {
    // Find messages by email
    List<ContactMessage> findByEmailOrderByCreatedAtDesc(String email);
    
    // Find recent messages
    List<ContactMessage> findTop10ByOrderByCreatedAtDesc();
} 