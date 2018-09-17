package com.spring.hungry.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.hungry.common.RimaAuth;
import com.spring.hungry.model.Favorite;
import com.spring.hungry.model.Restaurant;
import com.spring.hungry.model.User;
import com.spring.hungry.model.value.PagingRequest;
import com.spring.hungry.service.FavoriteService;
import com.spring.hungry.service.RestaurantService;
import com.spring.hungry.service.ReviewService;

@Controller
@RequestMapping("restaurant")
public class RestaurantController {
    @Autowired private RestaurantService restaurantService;
    @Autowired private ReviewService reviewService;
    @Autowired private FavoriteService favoriteService;
    
    @RimaAuth
    @RequestMapping(value = "/{restaurantId}", method = RequestMethod.GET)
    public String view(HttpSession session, Model model, @PathVariable("restaurantId") long restaurantId) {
    	
    	User user = (User) session.getAttribute("user");
    	Favorite favorite = new Favorite();
    	favorite.setUserId(user.getId());
    	favorite.setRestaurantId(restaurantId);

        model.addAttribute("rest", restaurantService.findById(restaurantId));
        model.addAttribute("reviews", reviewService.reviewList(restaurantId));
        model.addAttribute("restId",restaurantId);
        model.addAttribute("fav", favoriteService.findByUserIdAndRestaurantId(favorite));
        
        return "restaurant-detail";
    }
    
    @ResponseBody
    @RequestMapping(value = "/list.api")
    public List<Restaurant> list(@ModelAttribute PagingRequest pagingRequest) {
        List<Restaurant> list = restaurantService.list(pagingRequest);
        return list;
    }

}