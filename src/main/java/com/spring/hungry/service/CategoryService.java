package com.spring.hungry.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hungry.dao.CategoryDAO;
import com.spring.hungry.model.Category;

@Service
public class CategoryService {
    @Autowired private CategoryDAO categoryDAO;

    public List<Category> findAll() {
        return categoryDAO.findAll();
    }
}