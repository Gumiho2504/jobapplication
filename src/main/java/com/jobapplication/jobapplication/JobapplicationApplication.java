package com.jobapplication.jobapplication;

import com.jobapplication.jobapplication.model.Job;
import com.jobapplication.jobapplication.repository.JobRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.List;

@SpringBootApplication
public class JobapplicationApplication {

	public static void main(String[] args) {
		SpringApplication.run(JobapplicationApplication.class, args);
	}
	@Bean
	public CommandLineRunner commandLineRunner(JobRepository appDAO){
		return runner ->{


			System.out.println("Finding all jobs ... ");
//			List<Job> jobs = appDAO.findAll();
//			System.out.println("tempInstructor = " + jobs);
//			jobs.forEach(j -> System.out.println("the associate course : " + j.getUser()));
//			System.out.println("the associate course : " );
//			System.out.println("Done!");

		};
	}

	void addJob(Job job){
		
	}
}
