package com.jobapplication.jobapplication.service;

import com.jobapplication.jobapplication.dto.EducationDTO;
import com.jobapplication.jobapplication.model.Education;
import com.jobapplication.jobapplication.repository.EducationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EducationService {

    @Autowired
    private EducationRepository educationRepository;

    public Education createEducation (Education education){
        return educationRepository.save(education);
    }
}
