package com.spring.hungry.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hungry.dao.ReviewDAO;
import com.spring.hungry.model.Review;

@Service
public class ReviewService {
	@Autowired ReviewDAO reviewDAO;
	
	public Review insert(Review review, Long userId) {
		if(reviewDAO.countBy(review.getRestaurantId(), userId) < 1) {
			return reviewDAO.insert(review);
		}
		return null;
	}
	
	public List<Review> reviewList(long restaurantId){
		return reviewDAO.getReviewList(restaurantId);
	}
	
	public Review update(Review review) {
		return reviewDAO.update(review);
	}
	
	public void delete(long reviewId) {
		reviewDAO.delete(reviewId);
	}
	
	public void hide(long reviewId) {
		reviewDAO.hide(reviewId);
	}

	public void show(long reviewId) {
		reviewDAO.show(reviewId);
	}
}
