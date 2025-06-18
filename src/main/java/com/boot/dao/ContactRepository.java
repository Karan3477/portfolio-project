package com.boot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.boot.model.Contact;

public interface ContactRepository extends JpaRepository<Contact, Long> {
}