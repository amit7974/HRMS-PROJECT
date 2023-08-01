package com.controller;

import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.db.conn.DBcon;
import com.google.gson.Gson;
import com.model.Employee_Info;
import com.model.Qualification_info;
import com.model.Skill_info;
import com.model.User_info;
import com.model.entity.User_Registration;
import com.service.DropDownService;
import com.service.LoginService;
import com.service.RegistrationService;
import com.utils.GlobalConstant;

@Controller
public class Login {
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	LoginService loginService;
	@Autowired
	RegistrationService registerservice;
	@Autowired
	DBcon dBcon;
	@Autowired
	DropDownService dropdown;
	int count =0;
	@RequestMapping(value = "login")
	public ModelAndView login(@RequestParam(value = "error", required = false)String error){
		ModelAndView modelAndView = new ModelAndView();
		 modelAndView.setViewName("login");
		System.out.println("error : "+error);
        if (error != null) {
         modelAndView.addObject("error_message","Invalid username or password!!");
        }
        return modelAndView;
	}

	
	@RequestMapping(value = "verify", method = RequestMethod.POST)
	public String verify(ModelMap model,HttpSession session) {

		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		
		
			String email=auth.getName();
			User_Registration user = new User_Registration(); 
			user.setUser_name(email); 
			session.setAttribute("user",user);
			List<User_Registration> userdeatils = loginService.getEmailPassword(email);
			int status = userdeatils.get(0).getRegistration_status();
			
			switch (status) {
			 
			case 1: model.addAttribute("uinfo", new User_info());
			 dropdown.conn(dBcon.getCon()); model.put(GlobalConstant.COUNTRIES,
			 dropdown.getAllCountry()); return "user_info"; 
			 
			 case 2:
			 model.addAttribute("qual_info", new Qualification_info()); 
			 return "qualification_info"; 
			 
			 case 3: model.addAttribute(GlobalConstant.SKILL, new
			 Skill_info()); return "skill_info"; 
			 
			 case 4:return "redirect:/profile_page"; }
	
		return "redirect:/login";
	}
	
	@RequestMapping(value = "employee_profile", method = RequestMethod.POST)
	public String employee_profile(ModelMap model,HttpSession session) {

		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		
		Employee_Info emp=loginService.employee_details_by_email(auth.getName());
		String encoded = Base64.getEncoder().encodeToString(emp.getProfile_pic());
		emp.setBase64Image(encoded);
		model.addAttribute("employee_profile",emp);
		return "employee_profile";
	}
	
	@RequestMapping(value = "/perform-logout")
	public String logout(HttpServletRequest request,HttpServletResponse response) {
		
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		if(auth!=null)
		{
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		return "redirect:/login?logout";
	}

	@ResponseBody
	@RequestMapping(value = "status/{email:.+}", method = RequestMethod.GET)
	public String verify(@PathVariable("email") String email) {

		String result = loginService.check_status(email);
		return result;
	}
}
