package com.jobapplication.jobapplication.mapper;

import com.jobapplication.jobapplication.dto.ExperienceDTO;
import com.jobapplication.jobapplication.model.Experience;
import org.springframework.stereotype.Component;

@Component
public class ExperienceMapper {
    public Experience toExperience(ExperienceDTO experienceDTO){
        Experience experience = new Experience();
        experience.setId(experienceDTO.getId());
        experience.setTitle(experienceDTO.getTitle());
        experience.setCompany(experienceDTO.getCompany());
        experience.setDescription(experienceDTO.getDescription());
        experience.setStartDate(experienceDTO.getStartDate());
        experience.setEndDate(experienceDTO.getEndDate());
        return experience;
    }

    public ExperienceDTO toExperienceDTO(Experience experience){
        ExperienceDTO experienceDTO = new ExperienceDTO();
        experienceDTO.setId(experience.getId());
        experienceDTO.setTitle(experience.getTitle());
        experienceDTO.setCompany(experience.getCompany());
        experienceDTO.setDescription(experience.getDescription());
        experienceDTO.setStartDate(experience.getStartDate());
        experienceDTO.setEndDate(experience.getEndDate());
        return experienceDTO;
    }
}
