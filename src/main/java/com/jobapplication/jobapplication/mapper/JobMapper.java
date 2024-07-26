package com.jobapplication.jobapplication.mapper;

import com.jobapplication.jobapplication.dto.JobDTO;
import com.jobapplication.jobapplication.model.Job;
import org.springframework.stereotype.Component;

@Component
public class JobMapper {

    public JobDTO toJobDTO(Job job){
        JobDTO jobDTO = new JobDTO();
        jobDTO.setId(job.getId());
        jobDTO.setTitle(job.getTitle());
        jobDTO.setDescription(job.getDescription());
        jobDTO.setLocation(job.getLocation());
        jobDTO.setType(job.getType());
        jobDTO.setCompany(job.getCompany());
        return jobDTO;
    }
}
