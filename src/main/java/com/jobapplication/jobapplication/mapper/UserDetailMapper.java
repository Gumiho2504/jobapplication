package com.jobapplication.jobapplication.mapper;

import com.jobapplication.jobapplication.dto.EducationDTO;
import com.jobapplication.jobapplication.dto.ExperienceDTO;
import com.jobapplication.jobapplication.dto.SkillDTO;
import com.jobapplication.jobapplication.dto.UserDetailDTO;
import com.jobapplication.jobapplication.model.Education;
import com.jobapplication.jobapplication.model.Experience;
import com.jobapplication.jobapplication.model.Skill;
import com.jobapplication.jobapplication.model.UserDetail;
import org.springframework.stereotype.Component;

import java.util.stream.Collectors;

@Component
public class UserDetailMapper {




    public UserDetailDTO toUserDetailDTO(UserDetail userDetail){
        if (userDetail == null) {
            return new UserDetailDTO(); // or return a new UserDetailDTO() with default values if appropriate
        }else {
        UserDetailDTO userDetailDTO = new UserDetailDTO();
        userDetailDTO.setId(userDetail.getId());
        userDetailDTO.setDescription(userDetail.getDescription());
        if(userDetailDTO.getEducations() == null){
            EducationDTO educationDTO = new EducationDTO();
        }
        userDetailDTO.setEducations(userDetail.getEducations().stream()
                .map(education -> {
                    EducationDTO educationDTO = new EducationDTO();
                    educationDTO.setId(education.getId());
                    educationDTO.setSchool(education.getSchool());
                    educationDTO.setField(education.getField());
                    educationDTO.setEndDate(education.getEndDate());
                    educationDTO.setStartDate(education.getStartDate());
                    educationDTO.setDescription(education.getDescription());
                    return educationDTO;
                }).collect(Collectors.toList())
        );
        userDetailDTO.setSkills(userDetail.getSkills().stream()
                .map(skill -> {
                    SkillDTO skillDTO = new SkillDTO();
                    skillDTO.setId(skill.getId());
                    skillDTO.setName(skill.getName());
                    return skillDTO;
                }).collect(Collectors.toList())
        );
        userDetailDTO.setExperiences(userDetail.getExperiences().stream()
                .map(experience -> {
                    ExperienceDTO experienceDTO = new ExperienceDTO();
                    experienceDTO.setId(experience.getId());
                    experienceDTO.setTitle(experience.getTitle());
                    experienceDTO.setDescription(experience.getDescription());
                    experienceDTO.setStartDate(experience.getStartDate());
                    experienceDTO.setEndDate(experience.getEndDate());
                    experienceDTO.setWorking(experience.getWorking());
                    return experienceDTO;
                }).collect(Collectors.toList())
        );
        return userDetailDTO;
        }


    }

    public UserDetail toUserDetail(UserDetailDTO userDetailDTO){
        UserDetail userDetail = new UserDetail();
        userDetail.setId(userDetailDTO.getId());
        userDetail.setDescription(userDetailDTO.getDescription());

        userDetail.setEducations(userDetailDTO.getEducations().stream()
                .map(educationDTO -> {
                    Education education = new Education();
                    education.setId(educationDTO.getId());
                    education.setSchool(educationDTO.getSchool());
                    education.setField(educationDTO.getField());
                    education.setEndDate(educationDTO.getEndDate());
                    education.setStartDate(educationDTO.getStartDate());
                    education.setDescription(educationDTO.getDescription());
                    return education;
                }).collect(Collectors.toList())
        );

        userDetail.setSkills(userDetailDTO.getSkills().stream()
                .map(skillDTO -> {
                    Skill skill = new Skill();
                    skill.setId(skillDTO.getId());
                    skill.setName(skillDTO.getName());
                    return skill;
                }).collect(Collectors.toList())
        );

        userDetail.setExperiences(userDetailDTO.getExperiences().stream()
                .map(experienceDTO -> {
                    Experience experience = new Experience();
                    experience.setId(experienceDTO.getId());
                    experience.setTitle(experienceDTO.getTitle());
                    experience.setDescription(experienceDTO.getDescription());
                    experience.setStartDate(experienceDTO.getStartDate());
                    experience.setEndDate(experienceDTO.getEndDate());
                    experience.setWorking(experienceDTO.getWorking());
                    return experience;
                }).collect(Collectors.toList())
        );
        return userDetail;
    }


}
