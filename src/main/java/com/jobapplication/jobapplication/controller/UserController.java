package com.jobapplication.jobapplication.controller;

import com.jobapplication.jobapplication.dto.JobDTO;
import com.jobapplication.jobapplication.dto.UserDTO;
import com.jobapplication.jobapplication.mapper.UserMapper;
import com.jobapplication.jobapplication.model.Job;
import com.jobapplication.jobapplication.model.User;
import com.jobapplication.jobapplication.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;



    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public List<UserDTO> getAllUser() {
        return userService.getAllUser();
    }

    @GetMapping("/savejob/userid={id}")
    public List<JobDTO> getUserSaveJob(@PathVariable long id) {
        UserDTO userDTO = new UserDTO();
        List<JobDTO >  jobDTO = new ArrayList<>();;
        userDTO = userService.getUserById(id);
        jobDTO = userDTO.getSaveJobs();
        return jobDTO;
    }
//
//    GetMapping
//    public List<UserDTO> getAllUsers(){
//
//    }

    @GetMapping("/id={id}")
    public UserDTO getUserById(@PathVariable Long id) {
        return userService.getUserById(id);
    }

    @PostMapping()
    public void createUser(@RequestBody User user) {
        userService.createUser(user);
    }

    @PutMapping("/id={id}")
    public UserDTO updateUser(@PathVariable long id, @RequestBody UserDTO userDTO) {
       userService.updateUser(userDTO);
       return userService.getUserById(id);
    }

}
