package com.model;

import java.time.LocalDate;
import java.util.Date;

import com.model.entity.Current_Address;
import com.model.entity.Permanent_Address;

public class Employee_Info {

	private String user_name;

	private String first_name;

	private String last_name;

	private String phone;

	private String gender;

	private Date dob;
	
	 private byte[] profile_pic;
	    private String base64Image;
	
	private String address_line_1;
	private String address_line_2; 
	private String landmark; 
	private String city_name;
	private String state_name;
	private String pin_code;
	private String country_name;
	
	
	private String address_line_1p;
	private String address_line_2p; 
	private String landmarkp; 
	private String city_namep;
	private String state_namep;
	private String pin_codep;
	private String country_namep;
	
	private int current_address;
	
	private int permanent_address;

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	

	public byte[] getProfile_pic() {
		return profile_pic;
	}

	public void setProfile_pic(byte[] profile_pic) {
		this.profile_pic = profile_pic;
	}

	public String getBase64Image() {
		return base64Image;
	}

	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getAddress_line_1() {
		return address_line_1;
	}

	public void setAddress_line_1(String address_line_1) {
		this.address_line_1 = address_line_1;
	}

	public String getAddress_line_2() {
		return address_line_2;
	}

	public void setAddress_line_2(String address_line_2) {
		this.address_line_2 = address_line_2;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public String getState_name() {
		return state_name;
	}

	public void setState_name(String state_name) {
		this.state_name = state_name;
	}

	public String getPin_code() {
		return pin_code;
	}

	public void setPin_code(String pin_code) {
		this.pin_code = pin_code;
	}

	public String getCountry_name() {
		return country_name;
	}

	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}

	public String getAddress_line_1p() {
		return address_line_1p;
	}

	public void setAddress_line_1p(String address_line_1p) {
		this.address_line_1p = address_line_1p;
	}

	public String getAddress_line_2p() {
		return address_line_2p;
	}

	public void setAddress_line_2p(String address_line_2p) {
		this.address_line_2p = address_line_2p;
	}

	public String getLandmarkp() {
		return landmarkp;
	}

	public void setLandmarkp(String landmarkp) {
		this.landmarkp = landmarkp;
	}

	public String getCity_namep() {
		return city_namep;
	}

	public void setCity_namep(String city_namep) {
		this.city_namep = city_namep;
	}

	public String getState_namep() {
		return state_namep;
	}

	public void setState_namep(String state_namep) {
		this.state_namep = state_namep;
	}

	public String getPin_codep() {
		return pin_codep;
	}

	public void setPin_codep(String pin_codep) {
		this.pin_codep = pin_codep;
	}

	public String getCountry_namep() {
		return country_namep;
	}

	public void setCountry_namep(String country_namep) {
		this.country_namep = country_namep;
	}

	public int getCurrent_address() {
		return current_address;
	}

	public void setCurrent_address(int current_address) {
		this.current_address = current_address;
	}

	public int getPermanent_address() {
		return permanent_address;
	}

	public void setPermanent_address(int permanent_address) {
		this.permanent_address = permanent_address;
	}
	
	
}
