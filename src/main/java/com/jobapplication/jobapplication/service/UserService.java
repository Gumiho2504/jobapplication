package com.jobapplication.jobapplication.service;

import com.jobapplication.jobapplication.dto.JobDTO;
import com.jobapplication.jobapplication.dto.UserDTO;
import com.jobapplication.jobapplication.mapper.UserMapper;
import com.jobapplication.jobapplication.model.Job;
import com.jobapplication.jobapplication.model.User;
import com.jobapplication.jobapplication.repository.UserRepositoryImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    private final UserRepositoryImp userRepositoryImp;

    @Autowired
    private JobService jobService;

    @Autowired
    public UserService(UserRepositoryImp userRepositoryImp) {
        this.userRepositoryImp = userRepositoryImp;
    }

    public List<UserDTO> getAllUser(){
        return userRepositoryImp.findAll().stream()
                .map(userMapper::toUserDTO).toList();
    }

    public UserDTO getUserById(long id){
        UserDTO userDTO = new UserDTO();
        User tempUser = new User();
        tempUser = userRepositoryImp.findById(id);
        userDTO.setId(tempUser.getId());
        userDTO.setEmail(tempUser.getEmail());
        userDTO.setFirstName(tempUser.getFirstName());
        userDTO.setLastName(tempUser.getLastName());
        userDTO.setPassword(tempUser.getPassword());
        userDTO.setSaveJobs(

                tempUser.getSaveJobs().stream()
                        .map(job -> {
                            JobDTO jobDTO = new JobDTO();
                            jobDTO.setId(job.getId());
                            jobDTO.setTitle(job.getTitle());
                            jobDTO.setDescription(job.getDescription());
                            jobDTO.setLocation(job.getLocation());
                            jobDTO.setCompany(job.getCompany());
                            jobDTO.setType(job.getType());
                            return jobDTO;
                        })
                        .collect(Collectors.toList())

        );

        return userDTO;
    }

    public void createUser(User user){
         userRepositoryImp.createUser(user);
    }

    public void updateUser(UserDTO userDTO){
        User tempUser = new User();
        tempUser.setId(userDTO.getId());
        tempUser.setEmail(userDTO.getEmail());
        tempUser.setFirstName(userDTO.getFirstName());
        tempUser.setLastName(userDTO.getLastName());
        tempUser.setPassword(userDTO.getPassword());
        userDTO.getSaveJobs().forEach(jobDTO -> {
            Job job = new Job();
            job.setId(jobDTO.getId());
            job.setTitle(jobDTO.getTitle());
            job.setDescription(jobDTO.getDescription());
            job.setLocation(jobDTO.getLocation());
            job.setCompany(jobDTO.getCompany());
            job.setType(jobDTO.getType());
            tempUser.addJob(job);
        });
//        tempUser.setSaveJobs(userDTO.getSaveJobs().stream().map(jobs->{
//           Job job = new Job();
//           job.setId(jobs.getId());
//           job.setTitle(jobs.getTitle());
//           job.setDescription(jobs.getDescription());
//           job.setLocation(jobs.getLocation());
//           job.setCompany(jobs.getCompany());
//           job.setType(jobs.getType());
//           return job;
//        }).collect(Collectors.toList()));
        userRepositoryImp.updateUser(tempUser);
    }

    public void addSaveJob(long userId, long jobId) {
        // Retrieve the user by their ID
        User user = userRepositoryImp.findById(userId);
        if (user == null) {
            throw new IllegalArgumentException("User not found");
        }

        // Retrieve the job by its ID
//        Job job = jobService.getJobById(jobId);
//
//        if (job == null) {
//            throw new IllegalArgumentException("Job not found");
//        }

        // Convert JobDTO to Job
//        Job job = new Job();
//        job.setId(jobDTO.getId());
//        job.setTitle(jobDTO.getTitle());
//        job.setDescription(jobDTO.getDescription());
//        job.setLocation(jobDTO.getLocation());
//        job.setCompany(jobDTO.getCompany());
//        job.setType(jobDTO.getType());

        // Add the job to the user's saved jobs
      //  user.getSaveJobs().add(job);

        // Update the user in the repository
        userRepositoryImp.updateUser(user);
    }

}
