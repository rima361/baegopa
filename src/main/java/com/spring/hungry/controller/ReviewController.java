package com.spring.hungry.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.hungry.model.Review;
import com.spring.hungry.model.User;
import com.spring.hungry.service.ReviewService;

@Slf4j
@Controller
@RequestMapping("restaurant")
public class ReviewController {
	@Autowired ReviewService reviewService;

	@ResponseBody
	@RequestMapping(value = "/review.api", method = RequestMethod.POST)
	public Review saveReview(HttpSession session, @RequestBody Review review) {
		User user = (User) session.getAttribute("user");
		review.setUseYn("Y");
		review.setCreationDate(Timestamp.valueOf(LocalDateTime.now()));
		log.info(" review : " + review.toString());
		reviewService.insert(review, user.getId());

		review.setName(user.getName());
		return review;
	}

	@ResponseBody
	@RequestMapping(value = "/review/update.api", method = RequestMethod.POST)
	public Review updateReview(@RequestBody Review review) {
		return reviewService.update(review);
	}

	@ResponseBody
	@RequestMapping(value = "/review.api", method = RequestMethod.GET)
	public Boolean deleteReview(@RequestParam(value = "reviewId", required = true) Long reviewId) {
		reviewService.delete(reviewId);
		return true;
	}
	
	@ResponseBody
	@RequestMapping(value = "/review/hide.api", method = RequestMethod.GET)
	public Boolean hideReview(@RequestParam(value = "reviewId", required = true) Long reviewId) {
		reviewService.hide(reviewId);
		return true;
	}

	@ResponseBody
	@RequestMapping(value = "/review/show.api", method = RequestMethod.GET)
	public Boolean showReview(@RequestParam(value = "reviewId", required = true) Long reviewId) {
		reviewService.show(reviewId);
		return true;
	}
}
