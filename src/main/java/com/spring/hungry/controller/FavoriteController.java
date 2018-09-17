package com.spring.hungry.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.hungry.model.Favorite;
import com.spring.hungry.model.User;
import com.spring.hungry.service.FavoriteService;

@Controller
@RequestMapping("favorite")
public class FavoriteController {
	@Autowired private FavoriteService favoriteService;

	@ResponseBody
	@RequestMapping(value = "/save.api", method = RequestMethod.POST)
	public Favorite save(HttpSession session, @RequestBody Favorite favorite) {
		User user = (User) session.getAttribute("user");
		favorite.setUserId(user.getId());
		return favoriteService.insert(favorite);
	}

	@ResponseBody
	@RequestMapping(value = "/delete.api/{favoriteId}", method = RequestMethod.GET)
	public Favorite deleteApi(@PathVariable("favoriteId") Long favoriteId) {
		favoriteService.delete(favoriteId);
		return new Favorite();
	}
	
	@RequestMapping(value = "/delete/{favoriteId}", method = RequestMethod.GET)
	public String delete(@PathVariable("favoriteId") Long favoriteId) {
		favoriteService.delete(favoriteId);
		return "redirect:/";
	}
}