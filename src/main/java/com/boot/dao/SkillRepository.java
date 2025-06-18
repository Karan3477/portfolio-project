package com.boot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.boot.model.Skill;

public interface SkillRepository extends JpaRepository<Skill, Long> {
}