package com.spring.hungry.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

import com.spring.hungry.model.Menu;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hungry.dao.HashTagDAO;
import com.spring.hungry.dao.MenuDAO;
import com.spring.hungry.dao.RestaurantDAO;
import com.spring.hungry.model.HashTagMapping;
import com.spring.hungry.model.NaverLocalInfoItem;
import com.spring.hungry.model.NaverLocalInfoResponse;
import com.spring.hungry.model.Restaurant;
import com.spring.hungry.model.value.PagingRequest;

import javax.annotation.PostConstruct;

@Slf4j
@Service
public class RestaurantService {
	@Autowired private NaverLocalService naverLocalService;
	@Autowired private RestaurantDAO restaurantDAO;
	@Autowired private MenuDAO menuDAO;
	@Autowired private HashTagDAO hashTagDAO;
/*	public static Map<Long, Restaurant> cache = new HashMap<Long, Restaurant>();*/

/*	@PostConstruct
	public void initail() {
        CompletableFuture.supplyAsync(this::caching);
	}
*/
	public void callNaverLocalAPI() throws IOException {
		NaverLocalInfoResponse response = naverLocalService.get();
		List<NaverLocalInfoItem> naverLocalItem = response.getItems();

		for (NaverLocalInfoItem item : naverLocalItem) {
			Restaurant restaurant = new Restaurant();
			restaurant.setTitle(item.getTitle());
			restaurant.setDescription(item.getDescription());
			restaurant.setTel(item.getTelephone());
			restaurant.setAddress(item.getAddress());
			restaurant.setDeliveryYn("N");
			restaurant.setUseYn("Y");
			restaurantDAO.insert(restaurant);
		}
	}

	public List<Restaurant> list(PagingRequest pagingRequest) {
		List<Restaurant> list = restaurantDAO.list(pagingRequest);
		for (Restaurant restaurant : list) {
			/*Restaurant cac = cache.get(restaurant.getRestaurantId());*/
			/*if(cac == null) {
				restaurant.setHashTagList(hashTagDAO.findAllHashTagMapping(restaurant.getRestaurantId()));
				cache.put(restaurant.getRestaurantId(), restaurant);
			} else {
				restaurant.setHashTagList(cac.getHashTagList());
			}*/
			restaurant.setHashTagList(hashTagDAO.findAllHashTagMapping(restaurant.getRestaurantId()));
		}
		return list;
	}

/*	public List<Restaurant> caching() {
		PagingRequest request = new PagingRequest();
		request.setPageSize(100);
		return restaurantDAO.list(request).stream().peek( restaurant -> {
			restaurant.setMenuList(menuDAO.findAllByRestaurantId(restaurant.getRestaurantId()));
			restaurant.setHashTagList(hashTagDAO.findAllHashTagMapping(restaurant.getRestaurantId()));
			log.info("caching => " + restaurant.toString());
			cache.put(restaurant.getRestaurantId(), restaurant);
		}).collect(Collectors.toList());
	}
*/
	public Restaurant findById(long restaurantId) {
/*        Restaurant cacheRest = cache.get(restaurantId);
        if(cacheRest != null)
            return cacheRest;
*/
		Restaurant restaurant = restaurantDAO.findById(restaurantId);
		restaurant.setMenuList(menuDAO.findAllByRestaurantId(restaurantId));
		restaurant.setHashTagList(hashTagDAO.findAllHashTagMapping(restaurantId));
		/*cache.put(restaurantId, restaurant);*/
		return restaurant;
	}
	
	
}
