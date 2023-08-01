package com.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.db.conn.DBcon;
import com.model.Approval;
import com.model.Employees.Job_Vacancy;
import com.model.Leave_List;
import com.model.User_info;
import com.model.entity.Current_Address;
import com.model.entity.Employee_Registration;
import com.model.entity.Leave_Application;
import com.model.entity.Permanent_Address;
import com.model.entity.Users;
import com.service.DropDownService;
import com.service.EmpService;
import com.utils.GlobalConstant;

import validator.AgeValidator;
import validator.ImageValidator;

@Controller
@RequestMapping(value = "emp")
public class EmployeeController {
	@Autowired
	DropDownService dropdown;
	@Autowired
	DBcon dBcon;
	@Autowired
	EmpService empService;
	@Autowired
	AgeValidator empAgeValidator;
	@Autowired
	ImageValidator imageValidator;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping(value = "emp_register")
	public String emp_register(@ModelAttribute("employee_Registration") Employee_Registration employee_Registration) {
		return "emp_register";
	}

	@RequestMapping(value = "register")
	public String register(ModelMap modelMap,
			@ModelAttribute("employee_Registration") Employee_Registration employee_Registration, HttpSession session) {

		employee_Registration.setPassword(bCryptPasswordEncoder.encode(employee_Registration.getPassword()));
		employee_Registration.setStatus("pending");
		empService.save_emp_register(employee_Registration);
		session.setAttribute("employee_Registration", employee_Registration);
		modelMap.addAttribute("emp_info", new User_info());
		dropdown.conn(dBcon.getCon());
		modelMap.put(GlobalConstant.COUNTRIES, dropdown.getAllCountry());
		List<String> countries=dropdown.getCountries();
		modelMap.addAttribute("country", countries);
		return "redirect:/emp/employee_details_page";
	}
	@GetMapping(value = "/employee_details_page")
	public String user_details_page(ModelMap modelMap,@ModelAttribute("emp_info") User_info uinfo)
	{
		List<String> countries=dropdown.getCountries();
		modelMap.addAttribute("country", countries);
		return "EmployeeRegistration";
	}
	@RequestMapping(value = "register2")
	public String register2(ModelMap modelMap) {
		 if(!modelMap.containsAttribute("emp_info")) 
		 {
			 modelMap.addAttribute("emp_info", new User_info());
		 }
		dropdown.conn(dBcon.getCon());
		modelMap.put(GlobalConstant.COUNTRIES, dropdown.getAllCountry());
		List<String> countries=dropdown.getCountries();
		modelMap.addAttribute("country", countries);
		return "EmployeeRegistration";
	}
	
	@RequestMapping(value = "/registration_save", method = RequestMethod.POST)
	public String save_emp(@Valid @ModelAttribute("emp_info") User_info emp_info, BindingResult result, Users emp_info2,
			Current_Address emp_address, Permanent_Address emp_address2, HttpSession session,RedirectAttributes ra) throws IOException {

		imageValidator.validate(emp_info, result);
		empAgeValidator.validate(emp_info, result);

		if (result.hasErrors())

		{
			System.out.println(result.getFieldErrors());
			ra.addFlashAttribute("org.springframework.validation.BindingResult.emp_info", result);
			ra.addFlashAttribute("emp_info", emp_info);
			return "redirect:/emp/register2";
		}

		session.setAttribute("emp_profile", emp_info2);
		session.setAttribute("emp_address", emp_address);
		session.setAttribute("emp_address2", emp_address2);
		emp_info2.setCurrent_Address(emp_address);

		if (emp_address.getAddress_type().equals("c")) {
			emp_info2.setPermanent_Address(emp_address2);
		}

		empService.emp_details(emp_info2, emp_info, session);
		if (emp_address.getAddress_type().equals("pc")) {
			empService.equaladdress(emp_address, session);
		}

		return "employee_registration_success";
	}

	@RequestMapping(value = "leave_request")
	public String leave_request(@ModelAttribute("leave_application") Leave_Application leave_application,Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Approval reporting_manager=empService.getReporting_manager(auth.getName());
		List<Approval> approval_list=empService.getApproval2();
		model.addAttribute("reporting_manager",reporting_manager);
		model.addAttribute("approval_list",approval_list);
		return "leave_request";
	}

	@RequestMapping(value = "leave_apply")
	public String leave_apply(@ModelAttribute("leave_application") Leave_Application leave_application) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String employee_code=empService.getEmployee_code(auth.getName());
		LocalDate from_date = leave_application.getFrom_date();
		LocalDate to_date = leave_application.getTo_date();
		LocalDate from_time = LocalDate.of(from_date.getYear(), from_date.getMonthValue(), from_date.getDayOfMonth());
		LocalDate to_time = LocalDate.of(to_date.getYear(), to_date.getMonthValue(), to_date.getDayOfMonth());
		leave_application.setNo_of_days(Period.between(from_time, to_time).getDays()+1);
		leave_application.setApplied_date(LocalDate.now());
		leave_application.setApplied_by(employee_code);
		String approver1=leave_application.getApprover1();
		String approver2=leave_application.getApprover2();
		leave_application.setApprover1(approver1.substring(approver1.indexOf('(')+1,approver1.indexOf(')')));
		leave_application.setApprover2(approver2.substring(approver2.indexOf('(')+1,approver2.indexOf(')')));
		empService.save_Leave_Application(leave_application);
		return "redirect:/";
	}
	
	@RequestMapping(value = "leave_approval")
	public String leave_approval(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String emp_code=empService.getEmployee_code(auth.getName());
		model.addAttribute("approved_by", emp_code);
		return "leave_approval";
	}
	
	@RequestMapping(value = "approve_leave/{leave_id}/{approved_by}")
	public String approve_leave(@PathVariable("leave_id") int leave_id,@PathVariable("approved_by") String approved_by) {
		LocalDate date=LocalDate.now();
		empService.approve_leave(leave_id,approved_by,date);
		
		return "leave_approval";
	}
	@RequestMapping(value = "reject_leave/{leave_id}/{approved_by}")
	public String reject_leave(@PathVariable("leave_id") int leave_id,@PathVariable("approved_by") String approved_by) {
		LocalDate date=LocalDate.now();
		empService.reject_leave(leave_id,approved_by,date);
		
		return "leave_approval";
	}
	
	@ResponseBody
	@RequestMapping("/leave_remaining/{leave_type}")
	public int leave_remaining(@PathVariable("leave_type") String leave_type)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String emp_code=empService.getEmployee_code(auth.getName());
		
		int remaining_leave=empService.remaining_leave(emp_code,leave_type);
		return remaining_leave;
	}
	
	@ResponseBody
	@RequestMapping("/leave_validation/{start_date}/{end_date}/{leave_type}")
	public int leave_validation(@PathVariable("start_date") String start_date,@PathVariable("end_date") String end_date,@PathVariable("leave_type") String leave_type)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String emp_code=empService.getEmployee_code(auth.getName());
		LocalDate start=LocalDate.parse(start_date);
		LocalDate end=LocalDate.parse(end_date);
		int no_of_days=Period.between(start, end).getDays();
		
		int leave_validation=empService.leave_validation(emp_code,leave_type,no_of_days+1);
		if((no_of_days+1)>leave_validation)
		{
		return leave_validation;
		}
		return 0;
	}
	
	
	
	@ResponseBody
	@RequestMapping("/leave_by_status/{status}")
	public List<Leave_List> employee_by_status(@PathVariable("status") String status,Model model)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String emp_code=empService.getEmployee_code(auth.getName());
		model.addAttribute("approved_by", emp_code);
		List<Leave_List> emp=empService.employee_by_status(emp_code,status);
		return emp;
	}
	
	
	@ResponseBody
	@RequestMapping("/leave_details_by_id/{leave_id}")
	public Leave_List leave_details_by_id(@PathVariable("leave_id") int leave_id,Model model)
	{
		List<Leave_List> leave_details=empService.leave_details_by_id(leave_id);
		Leave_List leave=leave_details.get(0);
		return leave;
	}
	
	@RequestMapping(value = "leave_history")
	public String leave_history(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String emp_code=empService.getEmployee_code(auth.getName());
		Approval approver1=empService.getReporting_manager(auth.getName());
		model.addAttribute("approver1", approver1);
		model.addAttribute("emp_code", emp_code);
		List<Integer>applied_year= empService.getApplied_year_by_emp_code(emp_code);
		model.addAttribute("years",applied_year);
		return "leave_history";
	}
	@ResponseBody
	@RequestMapping("/leave_by_year/{year}/{emp_code}")
	public List<Leave_List> leave_by_year(@PathVariable("year") int year,@PathVariable("emp_code") String emp_code,Model model)
	{
		
		List<Leave_List> leave_details=empService.leave_by_year(year,emp_code);
		return leave_details;
	}
	@RequestMapping(value = "cancel_leave/{leave_id}")
	public String cancel_leave(@PathVariable("leave_id") int leave_id) {
		
		empService.cancel_leave(leave_id);
		
		return "leave_approval";
	}
	

	// My -Controller 
	
@Controller
public class Job_VacancyController {
	@RequestMapping("/")
	public String home() {
	return "own";
		
	}

	// show add the job_vacancy
	@RequestMapping("/ add_job_vacancy")	
	public String addJob_Vacancy(Model m) {
	m.addAttribute("title", "Add_Job_Vacancy");
	
		return "add_job_vacancy_form";
		
	}
		
		// create handler job_vacancy form
	
	
	@RequestMapping(value ="/submit_job_vacancy", method = RequestMethod.POST)	
		public RedirectView save_job_vacancy(@ModelAttribute Job_Vacancy job_vacancy,HttpServletRequest request){
			
		System.out.println(job_vacancy);
			RedirectView redirectView = new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/");
			return redirectView;
		}
		
	}
}
	


	