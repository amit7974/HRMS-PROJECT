package com.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.Approval;
import com.model.Leave_List;
import com.model.User_info;
import com.model.entity.Current_Address;
import com.model.entity.Employee_Registration;
import com.model.entity.Leave_Application;
import com.model.entity.Users;

@Service
public interface EmpService {

	void emp_details(Users emp_info, User_info info, HttpSession session);

	void equaladdress(Current_Address emp_address, HttpSession session);

	void save_emp_register(Employee_Registration employee_Registration);

	String getEmployee_code(String name);

	Approval getReporting_manager(String name);

	List<Approval> getApproval2();

	void save_Leave_Application(Leave_Application leave_application);

	void approve_leave(int leave_id, String approved_by, LocalDate localDate);

	void reject_leave(int leave_id, String approved_by, LocalDate date);

	List<Leave_List> employee_by_status(String emp_code,String status);

	List<Leave_List> leave_details_by_id(int leave_id);

	List<Integer> getApplied_year_by_emp_code(String emp_code);

	List<Leave_List> leave_by_year(int year, String emp_code);

	String getapprover1(String emp_code);

	void cancel_leave(int leave_id);

	int remaining_leave(String emp_code, String leave_type);

	int leave_validation(String emp_code, String leave_type, int i);
	
	
		}