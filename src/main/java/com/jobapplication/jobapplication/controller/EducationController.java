package com.jobapplication.jobapplication.controller;

import com.jobapplication.jobapplication.model.Education;
import com.jobapplication.jobapplication.service.EducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController("/education")
public class EducationController {


    @Autowired
    private EducationService educationService;

    @PostMapping("/")
    public Education createEducation(@RequestBody Education education){
        return educationService.createEducation(education);
    }
}
