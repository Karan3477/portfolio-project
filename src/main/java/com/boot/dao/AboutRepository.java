package com.boot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.boot.model.About;

public interface AboutRepository extends JpaRepository<About, Long> {
}