package com.jobapplication.jobapplication.mapper;

import com.jobapplication.jobapplication.dto.JobDTO;
import com.jobapplication.jobapplication.dto.UserDTO;
import com.jobapplication.jobapplication.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.stream.Collectors;

@Component
public class UserMapper {

    @Autowired
    UserDetailMapper userDetailMapper;

    public UserDTO toUserDTO(User user) {
        UserDTO userDTO = new UserDTO();
        userDTO.setId(user.getId());
        userDTO.setFirstName(user.getFirstName());
        userDTO.setLastName(user.getLastName());
        userDTO.setEmail(user.getEmail());
        userDTO.setPassword(user.getPassword());
        userDTO.setUserDetail(userDetailMapper.toUserDetailDTO(user.getUserDetail()));

        userDTO.setSaveJobs(
                user.getSaveJobs().stream()
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
}
