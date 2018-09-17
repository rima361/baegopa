package com.spring.hungry.controller;

import com.spring.hungry.model.User;
import com.spring.hungry.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class UserController {
    @Autowired private UserService userService;

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String loginAuth(HttpSession session, @ModelAttribute User user) {
        User loginUser = userService.login(user);
        if(loginUser != null) {
            log.info(loginUser.toString());
            session.setAttribute("user", loginUser);
            return "redirect:/";
        } else {
            return "redirect:/login";
        }
    }
    
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user != null) {
            session.setAttribute("user", null);
            return "redirect:/login";
        } else {
            return "redirect:/login";
        }
    }
}
