package com.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.model.Add_Holiday;
import com.model.Employee_Info;
import com.model.Employees;
import com.model.Filter_Result;
import com.model.Filter_User;
import com.model.Table_Data;
import com.model.entity.Company_Office_Details;
import com.model.entity.Geographic_Calendar;
import com.model.entity.Holiday_Calendar;
import com.model.entity.Holiday_Calendar_Description;
import com.model.entity.UploadFile;
import com.service.AdminService;
import com.service.DropDownService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
@Autowired
AdminService adminService;
@Autowired
DropDownService dropDownService;

	@RequestMapping(value = "/view_all")
	public ModelAndView view_all()
	{
		
		List<String>all_skill=adminService.getAllSkill();
		List<String>all_qual=adminService.getAllQual();
		ModelAndView mv=new ModelAndView("view_all");
		mv.addObject("all_qual", all_qual);
		mv.addObject("all_skill", all_skill);
		mv.addObject("filter",new Filter_User());
		return mv;
	}
	
	

	@ResponseBody
	@RequestMapping(value = "/filter_data/{qual}/{skill}/{min_qual}/{max_qual}/{min_skill}/{max_skill}/{page}",method = RequestMethod.GET)
	public Table_Data filter(@PathVariable("qual") String qual,@PathVariable("skill") String skill,@PathVariable("min_qual") String min_qual,@PathVariable("max_qual") String max_qual,@PathVariable("min_skill") String min_skill,@PathVariable("max_skill") String max_skill,@PathVariable("page") int page,Model model,HttpSession session)
	{
		
		if(!qual.equals("invalid"))
		{
			qual="'"+qual+"'";
			qual=qual.replace(",", "','");
			
		}
		if(!skill.equals("invalid"))
		{
			skill="'"+skill+"'";
			skill=skill.replace(",", "','");
		}
		if(min_qual.equals("invalid"))
			min_qual="0";
		
		if(max_qual.equals("invalid"))
			max_qual="100";
	
		if(min_skill.equals("invalid"))
			min_skill="0";
		
		if(max_skill.equals("invalid"))
			max_skill="1000";
		
		Table_Data td=new Table_Data();
		List<String> em=new ArrayList<String>();
		List<String> fn=new ArrayList<String>();
		List<String>ln=new ArrayList<String>();
		List<List<String>> ql=new ArrayList<List<String>>();
		List<List<String>> sk=new ArrayList<List<String>>();
		List<Integer> uid=new ArrayList<Integer>();
		List<Filter_Result> list=adminService.getFiltered_User(qual,skill,min_qual,min_skill,max_qual,max_skill,page);
		for(Filter_Result f:list)
		{	
			uid.add(f.getUser_id());
			em.add(f.getUser_name());
			fn.add(f.getFirst_name());
			ln.add(f.getLast_name());
			ql.add(adminService.getQualById(f.getUser_id()));
			sk.add(adminService.getSkillById(f.getUser_id()));
			
		}
		td.setEmail(em);
		td.setFirst_name(fn);
		td.setLast_name(ln);
		td.setQualification_name(ql);
		td.setSkill_name(sk);
		td.setUser_id(uid);
		int total_pages=(int) session.getAttribute("total_pages");
		td.setTotal_pages(total_pages);
		
		
		
		return td;
	}
	@GetMapping("/downloadFile/{fileId}")
	public ResponseEntity<ByteArrayResource> downloadFile(@PathVariable Integer fileId){
		UploadFile doc = adminService.getFile(fileId);
		
		return ResponseEntity.ok()
				.contentType(MediaType.parseMediaType("application/pdf"))
				.header(HttpHeaders.CONTENT_DISPOSITION,"attachment:filename=\""+doc.getFileName()+"\"")
				.body(new ByteArrayResource(doc.getData()));
		
	}
	@ResponseBody
	@GetMapping("/commonsq/{user_id}")
	public List<String> commonsq(@PathVariable("user_id") Integer user_id){
		
		List<String> qual=adminService.getQualById(user_id);
		return qual;
	}
	@ResponseBody
	@GetMapping("/commonskill/{user_id}")
	public List<String> commonskill(@PathVariable("user_id") Integer user_id){
		
		List<String> skill=adminService.getSkillById(user_id);
		
		return skill;
	}
	
	@GetMapping(value = "/download-zip", produces="application/zip")
	public void zipFiles(HttpServletResponse response) throws IOException {
		response.setStatus(HttpServletResponse.SC_OK);
	    response.addHeader("Content-Disposition", "attachment; filename=\"CV.zip\"");
	    List<UploadFile> list=adminService.getAllFile();
	    ZipOutputStream zipOutputStream = new ZipOutputStream(response.getOutputStream());

	    // create a list to add files to be zipped
	    

	    // package files
	    for (UploadFile file : list) {
	        //new zip entry and copying input stream with file to zipOutputStream, after all closing streams
	        zipOutputStream.putNextEntry(new ZipEntry(file.getUser_id()+".pdf"));
	    
	        InputStream fileInputStream = new ByteArrayInputStream(file.getData());

	        IOUtils.copy(fileInputStream, zipOutputStream);

	        fileInputStream.close();
	        zipOutputStream.closeEntry();
	    }    

	    zipOutputStream.close();
    }
	@RequestMapping("/list")
    public void listKids(Model model) {
		int page=2;
        adminService.listBy(page);
       
    }
	
	@RequestMapping("/employee_approval_requests")
	public ModelAndView approval_page()
	{
		List<Employees> employee_list= adminService.get_employees();
		List<String> managers=adminService.getManagers();
		List<Company_Office_Details> office=adminService.getAllOffice();
		ModelAndView mv=new ModelAndView("admin_approval");
		mv.addObject("employee_list",employee_list);
		mv.addObject("office",office);
		mv.addObject("managers",managers);
		return mv;
		
	}
	
	@RequestMapping("/reject_employee/{user_id}")
	public void reject_employee(@PathVariable("user_id") int id)
	{
		adminService.reject_employee(id);
	}
	@RequestMapping("/approve_employee/{user_id}/{employee_code}/{office_id}")
	public void approve_employee(@PathVariable("user_id") int id,@PathVariable("employee_code") String employee_code,@PathVariable("office_id") int office_id)
	{
		adminService.approve_employee(id,employee_code,office_id);
	}
	@ResponseBody
	@RequestMapping("/employee_details_by_id/{user_id}")
	public Employee_Info employee_details_by_id(@PathVariable("user_id") int user_id,Model model)
	{
		Employee_Info emp=adminService.employee_details_by_id(user_id);
		String encoded = Base64.getEncoder().encodeToString(emp.getProfile_pic());
		emp.setBase64Image(encoded);
		return emp;
	}
	
	@ResponseBody
	@RequestMapping("/employee_by_status/{status}")
	public List<Employees> employee_by_status(@PathVariable("status") String status,Model model)
	{
		List<Employees> emp=adminService.employee_by_status(status);
		return emp;
	}
	
	@ResponseBody
	@RequestMapping("/employee_search/{search_emp}")
	public List<Employees> employee_search(@PathVariable("search_emp") String search_emp,Model model)
	{
		List<Employees> emp=adminService.employee_search(search_emp);
		return emp;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getOfficeState/{country}")
	public List<String> getOfficeState(@PathVariable("country") String country)
	{
		List<String> state=adminService.getOfficeState(country);
		
		return state;
	}
	@ResponseBody
	@RequestMapping(value = "/getOfficeCity/{state}",method = RequestMethod.POST)
	public List<String> getOfficeCity(@PathVariable("state") String state)
	{
		List<String> city=adminService.getOfficeCity(state);
		
		return city;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getOfficeCountry",method = RequestMethod.POST)
	public List<String> getOfficeCountry()
	{
		List<String> country=adminService.getOfficeCountry();
		
		return country;
	}
	@RequestMapping("/holiday_calendar")
	public String holiday_calendar(@ModelAttribute("add_holiday") Add_Holiday add_holiday,Model model)
	{
		List<Integer> years=adminService.getCal_Year();
		List<Holiday_Calendar> holiday_cal=adminService.getHolidayCalendarAll();
		List<String> country=adminService.getOfficeCountry();
		model.addAttribute("country",country);
		model.addAttribute("holiday_cal",holiday_cal);
		model.addAttribute("years",years);
		return "holiday_calendar";
	}
	
	@RequestMapping("/save_holiday_calendar")
	public String save_holiday_calendar(@ModelAttribute("add_holiday") Add_Holiday add_holiday,@ModelAttribute("holiday_cal_desc") Holiday_Calendar_Description holiday_cal_desc)
	{
		
		
		
		LocalDate date=add_holiday.getDate();
		holiday_cal_desc.setDay(date.getDayOfMonth());
		holiday_cal_desc.setMonth(date.getMonthValue());
		
			for(int id:add_holiday.getInfo())
			{
				holiday_cal_desc.setHoliday_calendar_id(id);
				adminService.save_holiday_calendar(holiday_cal_desc);
			}
	
		return "redirect:/admin/holiday_calendar";
	}
	
	@RequestMapping("/geographic_calendar")
	public String geographic_calendar(@ModelAttribute("geographic_calendar") Geographic_Calendar geographic_calendar,Model model)
	{
		List<Holiday_Calendar> holiday=adminService.getHolidayCalendarAll();
		model.addAttribute("holiday", holiday);
		return "geographic_calendar";
	}
	@RequestMapping("/save_geographic_calendar")
	public String save_geographic_calendar(@ModelAttribute("geographic_calendar") Geographic_Calendar geographic_calendar)
	{
		adminService.save_geographic_calendar(geographic_calendar);
		return "geographic_calendar";
	}
@ResponseBody
@RequestMapping("/cal_year/{year}")
public List<Holiday_Calendar> getcalyear(@PathVariable("year") int year)
{
	List<Holiday_Calendar> hol_cal=adminService.getHolidayCalendarYear(year);
	return hol_cal;
}

@ResponseBody
@RequestMapping("/check_data_existance/{year}/{city}/{state}/{country}")
public int Check_Data_Existance(@PathVariable("year") int year,@PathVariable("city") String city,@PathVariable("state") String state,@PathVariable("country") String country)
{
	int status=adminService.getCheck_Data_Existance(city,state,country,year);
	return status;
}

@ResponseBody
@RequestMapping("/add_region/{year}/{city}/{state}/{country}")
public int add_region(@PathVariable("year") int year,@PathVariable("city") String city,@PathVariable("state") String state,@PathVariable("country") String country)
{
	int status=adminService.add_region(city,state,country,year);
	return status;
}

@RequestMapping("/add_office")
public String add_office(@ModelAttribute("office_details") Company_Office_Details office_details,Model model)
{

	List<String> country=dropDownService.getCountries();
	List<Geographic_Calendar> cal=adminService.getGeographic_Cal();
	model.addAttribute("geo_cal",cal);
	model.addAttribute("country",country);
	return "add_office";
}

@RequestMapping(value="/save_office",method = RequestMethod.POST)
public String save_office(@ModelAttribute("office_details") Company_Office_Details office_details,Model model)
{

	adminService.saveOffice(office_details);
	return "add_office";
}

@RequestMapping("/view_office")
public String view_office(@ModelAttribute("office_details") Company_Office_Details office_details,Model model)
{

	List<String> country=dropDownService.getCountries();
	List<Company_Office_Details> office=adminService.getAllOffice();
	model.addAttribute("office",office);
	model.addAttribute("country",country);
	return "view_office";
}
@RequestMapping("/edit_office/{id}")
public String edit_office(@ModelAttribute("office_details") Company_Office_Details office_details,Model model,@PathVariable("id") int id)
{

	List<String> country=dropDownService.getCountries();
	Company_Office_Details office=adminService.getOfficeById(id);
	List<Geographic_Calendar> cal=adminService.getGeographic_Cal();
	model.addAttribute("geo_cal",cal);
	model.addAttribute("office",office);
	model.addAttribute("country",country);
	return "edit_office";
}
@RequestMapping(value="/update_office",method = RequestMethod.POST)
public String update_office(@ModelAttribute("office_details") Company_Office_Details office_details,Model model)
{

	adminService.updateOffice(office_details);
	return "redirect:/admin/view_office";
}

@ResponseBody
@RequestMapping(value = "/getStates/{country}",method = RequestMethod.POST)
public List<String> getCities(@PathVariable("country") String country)
{
	List<String> states=dropDownService.getStates(country);
	
	return states;
}

@ResponseBody
@RequestMapping(value = "/getCities/{state}",method = RequestMethod.POST)
public List<String> getStates(@PathVariable("state") String state)
{
	List<String> cities=dropDownService.getCities(state);
	
	return cities;
}
@ResponseBody
@RequestMapping("/geographic_calendar_by_id/{user_id}")
public Geographic_Calendar geographic_calendar_by_id(@PathVariable("user_id") int user_id,Model model)
{
	Geographic_Calendar cal=adminService.geographic_calendar_by_id(user_id);
	return cal;
}
public String ex()
{
	return "Home";
}
}
