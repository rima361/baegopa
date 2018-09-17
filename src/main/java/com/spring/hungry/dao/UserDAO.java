package com.spring.hungry.dao;

import com.spring.hungry.common.CommonDAO;
import com.spring.hungry.model.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO extends CommonDAO{
    private static final String nameSpace = "user.";

    public User insert(User user) {
        super.insert(nameSpace + "save", user);
        return user;
    }

    public User findByEmailAndPassword(User user) {
        return (User) selectOne(nameSpace + "findByEmailAndPassword", user);
    }
}