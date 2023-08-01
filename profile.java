package com.model;

import java.time.LocalDate;
import java.util.ArrayList;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

public class profile {
	
	private String first_name;
	private String middle_name;
	private String last_name;
	private String email;
	private LocalDate dob;
	private String Address;
	private String landmark;
	private String country_name;
	private String state_name;
	private String city_name;
	private String gender;
	private String phone;
	private String pin_code;
	private String qualification_name;
	private String Qualification_Description;
	private String Marks_Detail;
	private String skill_name;
	private int user_id;
	private int experience_in_month;
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getMiddle_name() {
		return middle_name;
	}
	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public LocalDate getDob() {
		return dob;
	}
	public void setDob(LocalDate dob) {
		this.dob = dob;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getCountry_name() {
		return country_name;
	}
	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}
	public String getState_name() {
		return state_name;
	}
	public void setState_name(String state_name) {
		this.state_name = state_name;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPin_code() {
		return pin_code;
	}
	public void setPin_code(String pin_code) {
		this.pin_code = pin_code;
	}
	
	public String getQualification_name() {
		return qualification_name;
	}
	public void setQualification_name(String qualification_name) {
		this.qualification_name = qualification_name;
	}
	public String getQualification_Description() {
		return Qualification_Description;
	}
	public void setQualification_Description(String qualification_Description) {
		Qualification_Description = qualification_Description;
	}
	public String getMarks_Detail() {
		return Marks_Detail;
	}
	public void setMarks_Detail(String marks_Detail) {
		Marks_Detail = marks_Detail;
	}
	public String getSkill_name() {
		return skill_name;
	}
	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getExperience_in_month() {
		return experience_in_month;
	}
	public void setExperience_in_month(int experience_in_month) {
		this.experience_in_month = experience_in_month;
	}
	
}
