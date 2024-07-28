package com.jobapplication.jobapplication.dto;

import com.jobapplication.jobapplication.model.Education;
import com.jobapplication.jobapplication.model.Experience;
import com.jobapplication.jobapplication.model.Skill;
import com.jobapplication.jobapplication.model.User;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

public class UserDetailDTO {

    private Long id;
    private String description;
    private List<EducationDTO> educations;
    private List<SkillDTO> skills;
    private List<ExperienceDTO> experiences;

// Gettter and Setter


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }



    public List<EducationDTO> getEducations() {
        return educations;
    }

    public void setEducations(List<EducationDTO> educations) {
        this.educations = educations;
    }

    public List<SkillDTO> getSkills() {
        return skills;
    }

    public void setSkills(List<SkillDTO> skills) {
        this.skills = skills;
    }

    public List<ExperienceDTO> getExperiences() {
        return experiences;
    }

    public void setExperiences(List<ExperienceDTO> experiences) {
        this.experiences = experiences;
    }
}
