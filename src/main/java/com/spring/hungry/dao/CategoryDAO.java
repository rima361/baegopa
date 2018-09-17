package com.spring.hungry.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.hungry.common.CommonDAO;

@Repository
public class CategoryDAO extends CommonDAO{
    private static final String nameSpace = "category.";

    public List findAll() {
        return selectList(nameSpace + "findAll");
    }
}