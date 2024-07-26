package com.jobapplication.jobapplication.model;

import jakarta.persistence.*;

import java.util.Date;

@Entity
public class Job {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;
    private String location;
    private String company;
    private String type;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    public Job() {
    }

    public Job(String title, String description, String location, String company, String type) {

        this.title = title;
        this.description = description;
        this.location = location;
        this.company = company;
        this.type = type;
    }

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    // Override toString() for debugging purposes
    @Override
    public String toString() {
        return "Job{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", location='" + location + '\'' +
                ", company='" + company + '\'' +
                ", type='" + type + '\'' +

                '}';
    }
}
