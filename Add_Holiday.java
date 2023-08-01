package com.model;

import java.time.LocalDate;
import java.util.ArrayList;

import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class Add_Holiday {
	
	private String holiday_description; 
	private int calendar_year;
	private int month;
	private int day;
	private String city; 
	private String state; 
	private String country; 
	private ArrayList<Integer> info;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate date;
	
	public String getHoliday_description() {
		return holiday_description;
	}
	public void setHoliday_description(String holiday_description) {
		this.holiday_description = holiday_description;
	}
	public int getCalendar_year() {
		return calendar_year;
	}
	public void setCalendar_year(int calendar_year) {
		this.calendar_year = calendar_year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public ArrayList<Integer> getInfo() {
		return info;
	}
	public void setInfo(ArrayList<Integer> info) {
		this.info = info;
	}
	
	
	
	
	
	
}
