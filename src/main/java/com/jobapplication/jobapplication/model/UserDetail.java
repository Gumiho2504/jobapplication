package com.jobapplication.jobapplication.model;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "_user_detail")
public class UserDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String description;

    @OneToOne(mappedBy = "userDetail",cascade = CascadeType.ALL)
    private User user;


    @OneToMany(mappedBy = "userDetail",cascade = CascadeType.ALL)
    private List<Education> educations;

    public void  addEducation(Education education){
        if(educations == null){
            educations = new ArrayList<>();
        }
        educations.add(education);
        education.setUserDetail(this);
    }

    @OneToMany(mappedBy = "userDetail",cascade = CascadeType.ALL)
    private List<Skill> skills;
    public void  addSkill(Skill skill){
        if(skills == null){
            skills = new ArrayList<>();
        }
        skills.add(skill);
        skill.setUserDetail(this);
    }

    @OneToMany(mappedBy = "userDetail",cascade = CascadeType.ALL)
    private List<Experience> experiences;
    public void  addExperience(Experience experience){
        if(experiences == null){
            experiences = new ArrayList<>();
        }
        experiences.add(experience);
        experience.setUserDetail(this);
    }

    // constructor


    public UserDetail(String description, User user) {
        this.description = description;
        this.user = user;
    }

    public UserDetail() {}

    // Getter and Setter


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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Education> getEducations() {
        return educations;
    }

    public void setEducations(List<Education> educations) {
        this.educations = educations;
    }

    public List<Skill> getSkills() {
        return skills;
    }

    public void setSkills(List<Skill> skills) {
        this.skills = skills;
    }

    public List<Experience> getExperiences() {
        return experiences;
    }

    public void setExperiences(List<Experience> experiences) {
        this.experiences = experiences;
    }
}
