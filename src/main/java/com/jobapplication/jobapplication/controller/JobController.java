package com.jobapplication.jobapplication.controller;

import com.jobapplication.jobapplication.dto.JobDTO;
import com.jobapplication.jobapplication.model.Job;
import com.jobapplication.jobapplication.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/jobs")
public class JobController {

    @Autowired
    private JobService jobService;

    @GetMapping
    public List<JobDTO> getAllJobs() {
        return jobService.getAllJobs();
    }

    @GetMapping("/id={id}")
    public ResponseEntity<Job> getJobById(@PathVariable Long id) {
        return jobService.getJobById(id)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public Job createJob(@RequestBody Job job) {
        return jobService.saveJob(job);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Job> updateJob(@PathVariable Long id, @RequestBody Job jobDetails) {
        return jobService.getJobById(id)
                .map(job -> {
                    job.setTitle(jobDetails.getTitle());
                    job.setDescription(jobDetails.getDescription());
                    job.setLocation(jobDetails.getLocation());
                    job.setCompany(jobDetails.getCompany());
                    job.setType(jobDetails.getType().toString());
                    return ResponseEntity.ok(jobService.saveJob(job));
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteJob(@PathVariable Long id) {
        return jobService.getJobById(id)
                .map(job -> {
                    jobService.deleteJob(id);
                    return ResponseEntity.ok().<Void>build();
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }
}
