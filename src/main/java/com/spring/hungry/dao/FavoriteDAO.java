package com.spring.hungry.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.spring.hungry.common.CommonDAO;
import com.spring.hungry.model.Favorite;

@Component
public class FavoriteDAO extends CommonDAO {
    private static final String nameSpace = "favorite.";

    public List<Favorite> findAllByUserId(Long userId) {
        return super.selectList(nameSpace + "findAllByUserId", userId);
    }
    
    public List<Favorite> findByUserIdAndRestaurantId(Favorite favorite) {
        return super.selectList(nameSpace + "findByUserIdAndRestaurantId", favorite);
    }
        
    public void insert(Favorite favorite) {
        super.insert(nameSpace + "insert", favorite);
    }

    public Long seq(){
        return (Long) super.selectOne(nameSpace + "seq");
    }

    public void delete(Long favoriteId) {
        super.delete(nameSpace + "delete", favoriteId);
    }
}