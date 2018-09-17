package com.spring.hungry.dao;

import java.util.List;

import com.spring.hungry.model.Menu;
import org.springframework.stereotype.Repository;

import com.spring.hungry.common.CommonDAO;

@Repository
public class MenuDAO extends CommonDAO{
    private static final String nameSpace = "menu.";

    public List<Menu> findAllByRestaurantId(Long restaurantId) {
        return selectList(nameSpace + "findAllByRestId", restaurantId);
    }
}