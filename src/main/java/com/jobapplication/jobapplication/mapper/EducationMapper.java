package com.jobapplication.jobapplication.mapper;


import com.jobapplication.jobapplication.dto.EducationDTO;
import com.jobapplication.jobapplication.model.Education;
import org.springframework.stereotype.Component;

@Component
public class EducationMapper {

    public Education toEducation(EducationDTO educationDTO){
        Education education = new Education();
        education.setId(educationDTO.getId());
        education.setSchool(educationDTO.getSchool());
        education.setDescription(educationDTO.getDescription());
        education.setField(educationDTO.getField());
        education.setStartDate(educationDTO.getStartDate());
        education.setEndDate(educationDTO.getEndDate());
        return education;
    }

    public EducationDTO toEducationDTO(Education education){
        EducationDTO educationDTO = new EducationDTO();
        educationDTO.setId(education.getId());
        educationDTO.setSchool(education.getSchool());
        educationDTO.setDescription(education.getDescription());
        educationDTO.setField(education.getField());
        educationDTO.setStartDate(education.getStartDate());
        educationDTO.setEndDate(education.getEndDate());
        return educationDTO;
    }
}
