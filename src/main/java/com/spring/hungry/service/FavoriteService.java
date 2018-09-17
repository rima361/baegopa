package com.spring.hungry.service;

import java.util.List;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hungry.dao.FavoriteDAO;
import com.spring.hungry.model.Favorite;

@Slf4j
@Service
public class FavoriteService {
	@Autowired private FavoriteDAO favoriteDAO;

	public List<Favorite> findAllByUserId(Long userId) {
		return favoriteDAO.findAllByUserId(userId);
	}
	
	public Favorite findByUserIdAndRestaurantId(Favorite favorite) {
		List<Favorite> favoriteList =  favoriteDAO.findByUserIdAndRestaurantId(favorite);
		return (favoriteList.size() > 0 ) ? favoriteList.get(0) : null;
	}
	
	public Favorite insert(Favorite favorite) {
		Long seq = favoriteDAO.seq();

		favorite.setFavoriteId(seq);
		log.info(" fav : " + favorite.toString());
		favoriteDAO.insert(favorite);
		return favorite;
	}
	
	public void delete(Long favoriteId) {
        favoriteDAO.delete(favoriteId);
    }
	
}