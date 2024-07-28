package com.jobapplication.jobapplication.repository;

import com.jobapplication.jobapplication.model.Skill;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SkillRepository extends JpaRepository<Skill, Long> {
}
