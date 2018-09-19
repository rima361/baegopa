package com.spring.hungry;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.hungry.model.Image;
import com.spring.hungry.model.Restaurant;
import com.spring.hungry.service.ImageService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.hungry.common.RimaAuth;
import com.spring.hungry.model.User;
import com.spring.hungry.model.value.PagingRequest;
import com.spring.hungry.service.FavoriteService;
import com.spring.hungry.service.RestaurantService;

@Controller
public class HomeController {
	@Autowired private RestaurantService restaurantService;
	@Autowired private FavoriteService favoriteService;
	@Autowired private ImageService imageService;

	@RimaAuth
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session, PagingRequest request) {
		User user = (User) session.getAttribute("user");
		//RestaurantService.cache = new HashMap<>();
		model.addAttribute("query", request.getQuery());
		model.addAttribute("categoryId", request.getCategoryId());
		model.addAttribute("favList", favoriteService.findAllByUserId(user.getId()));
		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value = "/api/test", method = RequestMethod.GET)
	public String apiTest() throws IOException {
		restaurantService.callNaverLocalAPI();
		return "success";
	}

	@ResponseBody
	@RequestMapping(value = "/api/crawler", method = RequestMethod.GET)
	public String crawlingTest() throws IOException {
		PagingRequest pagingRequest = new PagingRequest();
		pagingRequest.setPageSize(100);

		List<Restaurant> restaurantList = restaurantService.list(pagingRequest);
		List<Image> imageList = new ArrayList<Image>();

		for(Restaurant rest : restaurantList) {
			Long restaurantId = rest.getRestaurantId();
			String restaurantName = rest.getTitle();
			restaurantName.replaceAll("<b>", "");
			restaurantName.replaceAll("</b>", "");

			if(!restaurantName.contains("판교")) restaurantName += " 판교";

			String url = "https://search.naver.com/search.naver?query="+ restaurantName;
			String encodedUrl = new String(url.getBytes("UTF-8"), "UTF-8");
			System.out.println("음식점 >>" + restaurantName + "url  >> " + encodedUrl);
			Document doc = Jsoup.connect(encodedUrl).ignoreContentType(true).userAgent("Mozilla").get();
			Elements images = doc.select("img[src~=(?i)\\.(jpe?g)]");

			Image image = new Image();
			image.setRestaurantId(restaurantId);
			if(images.size() < 1) {
				image.setImgUrl("/img/default.png");
			} else {
				image.setImgUrl(images.get(0).attr("src"));
			}

			imageList.add(image);
		}
		imageService.insertImageList(imageList);
		return imageList.toString();
	}
/*
	@RequestMapping("/cache/clear")
	public String cacheClear() {
		RestaurantService.cache = new HashMap<>();
		restaurantService.caching();
		return "/";
	}*/
}