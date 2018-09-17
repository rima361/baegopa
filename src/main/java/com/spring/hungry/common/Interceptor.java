package com.spring.hungry.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.hungry.model.User;
import com.spring.hungry.service.CategoryService;

public class Interceptor extends HandlerInterceptorAdapter {
	@Autowired private CategoryService categoryService;
    
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        RimaAuth rimaAuth = ((HandlerMethod) handler).getMethodAnnotation(RimaAuth.class);
        if(rimaAuth != null) {
            if(request.getSession().getAttribute("user") == null) {
                response.sendRedirect( "/login");
                return false;
            }
        }
        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
        // 유저정보가 필요없는 URI API거나, Login이 되어 있으면 유저 정보를 가져오기 않는다
        if(!request.getRequestURI().contains("api") && !request.getRequestURI().contains("login") && request.getSession().getAttribute("user") != null) {
            User user = (User) request.getSession().getAttribute("user");
            modelAndView.addObject("user", user);
            modelAndView.addObject("categoryList", categoryService.findAll());
        }
    }
}
