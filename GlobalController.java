package com.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.model.User_Login_Info;
import com.service.RegistrationService;

@ControllerAdvice
public class GlobalController {

	@Autowired
	private HttpSession session;
	@Autowired
	RegistrationService reg_service;
	private User_Login_Info user_login_info =null;
	@ModelAttribute("user_login_info")
	public User_Login_Info user_login_info()
	{
		if(session.getAttribute("user_login_info")==null) {
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		user_login_info=reg_service.getUser_Login_Info(auth.getName());
		if(user_login_info!=null)
		{
			session.setAttribute("user_login_info", user_login_info);
		}
		return user_login_info;
		}
		return (User_Login_Info) session.getAttribute("user_login_info");
	}
	

}
