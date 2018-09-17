package com.spring.hungry.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.hungry.common.CommonDAO;

@Repository
public class HashTagDAO extends CommonDAO{
    private static final String nameSpace = "hashTag.";

    public List findAllHashTagMapping(Long restaurantId) {
        return selectList(nameSpace + "findAllHashTagMapping", restaurantId);
    }
}
