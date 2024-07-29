package com.jobapplication.jobapplication.service;

import com.jobapplication.jobapplication.dto.UserDetailDTO;
import com.jobapplication.jobapplication.mapper.UserDetailMapper;
import com.jobapplication.jobapplication.model.UserDetail;
import com.jobapplication.jobapplication.repository.UserDetailRepository;
import com.jobapplication.jobapplication.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserDetailService {

    @Autowired
    private UserDetailRepository userDetailRepository;

    @Autowired
    private UserDetailMapper userDetailMapper;


    public UserDetailService() {}


    public UserDetailDTO addUserDetail(UserDetailDTO userDetailDTO) {
        UserDetail userDetail = userDetailMapper.toUserDetail(userDetailDTO);
        userDetail = userDetailRepository.save(userDetail);
        return userDetailDTO;
    }
}
