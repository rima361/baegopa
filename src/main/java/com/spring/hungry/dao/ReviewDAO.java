package com.spring.hungry.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.hungry.common.CommonDAO;
import com.spring.hungry.model.Review;

@Repository
public class ReviewDAO extends CommonDAO {

	private static final String nameSpace = "review.";

	public Long seq(){
		return (Long) super.selectOne(nameSpace + "seq");
	}
	
	public Review insert(Review review) {
		review.setReviewId(seq());
		super.insert(nameSpace + "save", review);
		return review;
	}

	public List<Review> getReviewList(long restaurantId) {
		return super.selectList(nameSpace + "reviewList", restaurantId);
	}
	
	public Review update(Review review) {
		  super.update(nameSpace + "update", review);
		  return review;
	}
	
	public void delete(long reviewId) {
		super.delete(nameSpace + "delete", reviewId);
	}
	
	public void hide(long reviewId) { super.update(nameSpace + "hide", reviewId); }

	public void show(long reviewId) { super.update(nameSpace + "show", reviewId); }

	public Long countBy(long restaurantId, long userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restaurantId", restaurantId);
		map.put("userId", userId);
		return (Long) super.selectOne("countBy", map);
	}

}
