package com.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.model.Employee_Info;
import com.model.entity.User_Registration;

@Service
public interface LoginService {

	List<User_Registration> getEmailPassword(String email);

	String check_status(String email);

	Employee_Info employee_details_by_email(String name);

}
