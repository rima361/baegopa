package com.spring.hungry.service;

import com.spring.hungry.dao.UserDAO;
import com.spring.hungry.model.User;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class UserService {
    @Autowired private UserDAO userDAO;

    public User insert(User user) {
        return userDAO.insert(user);
    }

    public User login(User user) {
        return userDAO.findByEmailAndPassword(user);
    }
}
