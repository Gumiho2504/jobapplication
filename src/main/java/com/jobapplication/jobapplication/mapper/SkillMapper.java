package com.jobapplication.jobapplication.mapper;

import com.jobapplication.jobapplication.dto.SkillDTO;
import com.jobapplication.jobapplication.model.Skill;
import org.springframework.stereotype.Component;

@Component
public class SkillMapper {
    public Skill toSkill(SkillDTO skillDTO){
        Skill skill = new Skill();
        skill.setId(skillDTO.getId());
        skill.setName(skillDTO.getName());
        return skill;
    }

    public SkillDTO toSkillDTO(Skill skill){
        SkillDTO skillDTO = new SkillDTO();
        skillDTO.setId(skill.getId());
        skillDTO.setName(skill.getName());
        return skillDTO;
    }
}
