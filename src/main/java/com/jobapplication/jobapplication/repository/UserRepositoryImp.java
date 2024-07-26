package com.jobapplication.jobapplication.repository;

import com.jobapplication.jobapplication.model.Job;
import com.jobapplication.jobapplication.model.User;
import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class UserRepositoryImp implements UserRepository
{
    private EntityManager entityManager;

    @Autowired
    public UserRepositoryImp(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<User> findAll() {
        List<User> tempUsers = entityManager.createQuery("from User", User.class).getResultList();
        return tempUsers;
    }

    @Override

    public User findById(Long id) {
        User tempUser = entityManager.find(User.class, id);
        return tempUser;
    }

    @Override
    @Transactional
    public void createUser(User user) {
        entityManager.persist(user);
    }

    @Override
    public User addSaveJob(long id) {
        return null;
    }

    @Override
    @Transactional
    public void updateUser(User tempUser) {
            entityManager.merge(tempUser);
    }


}
