package com.boot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.boot.model.Project;

public interface ProjectRepository extends JpaRepository<Project, Long> {
} 