package com.spring.hungry.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.spring.hungry.common.CommonDAO;
import com.spring.hungry.model.Restaurant;
import com.spring.hungry.model.value.PagingRequest;

@Component
public class RestaurantDAO extends CommonDAO {
	private static final String nameSpace = "restaurant.";

	public void insert(Restaurant restaurant) {
		super.insert(nameSpace + "save", restaurant);
	}

	public List<Restaurant> list(PagingRequest pagingRequest) {
		return selectList(nameSpace + "srchList", pagingRequest);
	}

	public Restaurant findById(long restaurantId) {
		return (Restaurant) selectOne(nameSpace + "findOne", restaurantId);
	}
}
