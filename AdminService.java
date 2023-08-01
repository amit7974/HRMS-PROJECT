package com.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.model.Employee_Info;
import com.model.Employees;
import com.model.Filter_Result;
import com.model.Filter_User;
import com.model.entity.Company_Office_Details;
import com.model.entity.Geographic_Calendar;
import com.model.entity.Holiday_Calendar;
import com.model.entity.Holiday_Calendar_Description;
import com.model.entity.UploadFile;

@Service
public interface AdminService {
public List getAllUser(Filter_User filter);

public List<String> getAllQual();

public List<String> getAllSkill();

public List<Filter_Result> getFiltered_User(String qual, String skill,String min_qual,String min_skill,String max_qual,String max_skill,int page);

public UploadFile getFile(Integer fileId);

public List<String> getQualById(Integer user_id);

public List<String> getSkillById(Integer user_id);

public List<UploadFile> getAllFile();



public void listBy(int page);

public List<Employees> get_employees();

public void reject_employee(int id);

public void approve_employee(int id, String employee_code, int office_id);

public Employee_Info employee_details_by_id(int user_id);

public List<Employees> employee_by_status(String status);

public List<Employees> employee_search(String search_emp);

public List<String> getOfficeState(String country);

public List<String> getOfficeCity(String state);

public void save_holiday_calendar(Holiday_Calendar_Description holiday_cal_desc);

public void save_geographic_calendar(Geographic_Calendar geographic_calendar);

public List<Holiday_Calendar> getHolidayCalendarAll();

List<Holiday_Calendar> getHolidayCalendarYear(int year);

public List<Integer> getCal_Year();

public int getCheck_Data_Existance(String city, String state, String country, int year);

public int add_region(String city, String state, String country, int year);

public List<String> getOfficeCountry();

public List<Geographic_Calendar> getGeographic_Cal();

public void saveOffice(Company_Office_Details office_details);

public List<Company_Office_Details> getAllOffice();

public Company_Office_Details getOfficeById(int id);

public void updateOffice(Company_Office_Details office_details);

public Geographic_Calendar geographic_calendar_by_id(int user_id);

public List<String> getManagers();


}
