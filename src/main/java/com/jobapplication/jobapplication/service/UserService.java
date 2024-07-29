package com.jobapplication.jobapplication.service;

import com.jobapplication.jobapplication.dto.JobDTO;
import com.jobapplication.jobapplication.dto.UserDTO;
import com.jobapplication.jobapplication.dto.UserDetailDTO;
import com.jobapplication.jobapplication.mapper.UserDetailMapper;
import com.jobapplication.jobapplication.mapper.UserMapper;
import com.jobapplication.jobapplication.model.Job;
import com.jobapplication.jobapplication.model.User;
import com.jobapplication.jobapplication.model.UserDetail;
import com.jobapplication.jobapplication.repository.UserRepositoryImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    private final UserRepositoryImp userRepositoryImp;

    @Autowired
    private JobService jobService;

    @Autowired UserDetailService userDetailService;
    @Autowired
    private UserDetailMapper userDetailMapper;

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
        userDTO  = userMapper.toUserDTO(tempUser);
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

        // create user detail
        if(userDTO.getUserDetail() != null){
            UserDetailDTO userDetailDTO = new UserDetailDTO();
            userDetailDTO = userDTO.getUserDetail();
            if(userDetailDTO.getEducations() == null){
                userDetailDTO.setEducations(new ArrayList<>());
            }
            if(userDetailDTO.getExperiences() == null){
                userDetailDTO.setExperiences(new ArrayList<>());
            }
            if(userDetailDTO.getSkills() == null){
                userDetailDTO.setSkills(new ArrayList<>());
            }
            userDetailService.addUserDetail(userDTO.getUserDetail());
            tempUser.setUserDetail(userDetailMapper.toUserDetail(userDTO.getUserDetail()));


        }

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
