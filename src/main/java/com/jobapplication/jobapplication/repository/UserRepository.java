package com.jobapplication.jobapplication.repository;

import com.jobapplication.jobapplication.model.Job;
import com.jobapplication.jobapplication.model.User;
import jakarta.persistence.EntityManager;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface UserRepository  {
    List<User> findAll();

    User findById(Long id);

    void createUser(User user);

    User addSaveJob(long id);

    void updateUser(User tempUser);
}
