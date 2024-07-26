package com.jobapplication.jobapplication.repository;

import com.jobapplication.jobapplication.model.Job;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JobRepository extends JpaRepository<Job, Long> {

}
