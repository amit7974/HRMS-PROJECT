package com.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

public class Employees {
	private int users_id;
	private String first_name;
    private String last_name;
    private String status;
    private String user_name;
    private String employee_code;
   
	public int getUsers_id() {
		return users_id;
	}
	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	
	
	public String getEmployee_code() {
		return employee_code;
	}
	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	

// My Entity Class
	
	@Entity
public class Job_Vacancy{
	
		@Id
		@GeneratedValue(strategy = GenerationType.AUTO)
	public int job_vacancy_id;
	public String experience_required;
	public String salary_lower_range;
	public String salary_upper_range;
	public String vacancy_added_on;
	public int is_active;
	
	public int getJob_vacancy_id() {
		return job_vacancy_id;
	}
	public void setJob_vacancy_id(int job_vacancy_id) {
		this.job_vacancy_id = job_vacancy_id;
	}
	public String getExperience_required() {
		return experience_required;
	}
	public void setExperience_required(String experience_required) {
		this.experience_required = experience_required;
	}
	public String getSalary_lower_range() {
		return salary_lower_range;
	}
	public void setSalary_lower_range(String salary_lower_range) {
		this.salary_lower_range = salary_lower_range;
	}
	public String getSalary_upper_range() {
		return salary_upper_range;
	}
	public void setSalary_upper_range(String salary_upper_range) {
		this.salary_upper_range = salary_upper_range;
	}
	public String getVacancy_added_on() {
		return vacancy_added_on;
	}
	public void setVacancy_added_on(String vacancy_added_on) {
		this.vacancy_added_on = vacancy_added_on;
	}
	public int getIs_active() {
		return is_active;
	}
	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}
	public Job_Vacancy(int job_vacancy_id, String experience_required, String salary_lower_range,
			String salary_upper_range, String vacancy_added_on, int is_active) {
		super();
		this.job_vacancy_id = job_vacancy_id;
		this.experience_required = experience_required;
		this.salary_lower_range = salary_lower_range;
		this.salary_upper_range = salary_upper_range;
		this.vacancy_added_on = vacancy_added_on;
		this.is_active = is_active;
	}
	public Job_Vacancy() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Job_Vacancy [job_vacancy_id=" + job_vacancy_id + ", experience_required=" + experience_required
				+ ", salary_lower_range=" + salary_lower_range + ", salary_upper_range=" + salary_upper_range
				+ ", vacancy_added_on=" + vacancy_added_on + ", is_active=" + is_active + "]";
	}
}
	
}