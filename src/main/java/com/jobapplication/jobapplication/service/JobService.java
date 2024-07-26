package com.jobapplication.jobapplication.service;

import com.jobapplication.jobapplication.dto.JobDTO;
import com.jobapplication.jobapplication.mapper.JobMapper;
import com.jobapplication.jobapplication.model.Job;
import com.jobapplication.jobapplication.repository.JobRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class JobService {

    @Autowired
    private JobRepository jobRepository;

    @Autowired
    private JobMapper jobMapper;

    public List<JobDTO> getAllJobs() {
        return jobRepository.findAll().stream()
                .map(jobMapper::toJobDTO).toList();
    }

    public Optional<Job> getJobById(Long id) {
        return jobRepository.findById(id);
    }

    public Job saveJob(Job job) {
        return jobRepository.save(job);
    }

    public void deleteJob(Long id) {
        jobRepository.deleteById(id);
    }
}
