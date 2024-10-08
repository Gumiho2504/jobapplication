package com.jobapplication.jobapplication.dto;

import java.util.List;

public class UserDTO {
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private List<JobDTO> saveJobs;
   private UserDetailDTO userDetail;
    // Getters and setters


    public UserDetailDTO getUserDetail() {
        return userDetail;
    }

    public void setUserDetail(UserDetailDTO userDetail) {
        this.userDetail = userDetail;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<JobDTO> getSaveJobs() {
        return saveJobs;
    }

    public void setSaveJobs(List<JobDTO> saveJobs) {
        this.saveJobs = saveJobs;
    }
}
