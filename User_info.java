package com.model;

import java.time.LocalDate;
import java.util.Date;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class User_info {

	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate dob;

	@Size(min = 3, message = "Enter minimum 3 characters!")
	private String Address_line_1;

	private String Address_line_2;

	private String landmark;
	@Size(min = 3, message = "Enter minimum 3 characters!")
	private String addressp;

	private String address2p;

	private String landmarkp;

	@Size(min = 3, message = "Please select a valid country!")
	private String country_namep;

	@Size(min = 3, message = ("Please select a valid state!"))
	private String state_namep;

	@Length(min = 3, max = 30, message = "Please select a valid city!")
	private String city_namep;

	@Size(min = 3, message = "Please select a valid country!")
	private String country_name;

	@Size(min = 3, message = ("Please select a valid state!"))
	private String state_name;
	@Length(min = 3, max = 30, message = "Please select a valid city!")
	private String city_name;

	private String gender;
	@Size(min = 3, max = 25, message = "Enter atleast 3 character")
	@Pattern(regexp = "^[a-zA-Z]+$", message = "Enter Valid Name")
	private String first_name;

	@Pattern(regexp = "^[a-zA-Z]*$", message = "Enter Valid Name")
	private String middle_name;

	@Pattern(regexp = "^[a-zA-Z]+$", message = "Enter Valid Name")
	@Size(min = 3, max = 25, message = "Enter atleast 3 character")
	private String last_name;

	@Size(min = 10, max = 10, message = "Enter 10 digit Mobile no.")
	@Digits(fraction = 0, integer = 10, message = "Enter numbers")
	private String phone;
	@Size(min = 6, max = 6, message = "Enter Valid Pin!")
	@Digits(fraction = 0, integer = 10, message = "Enter PinCode")
	private String pin_code;

	@Digits(fraction = 0, integer = 10, message = "Enter PinCode")
	private String pin_codep;
	
	private MultipartFile file;

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

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

	public String getPin_code() {
		return pin_code;
	}

	public void setPin_code(String pin_code) {
		this.pin_code = pin_code;
	}

	public LocalDate getDob() {
		return dob;
	}

	public void setDob(LocalDate time) {
		this.dob = time;
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

	public String getAddressp() {
		return addressp;
	}

	public void setAddressp(String addressp) {
		this.addressp = addressp;
	}

	public String getAddress2p() {
		return address2p;
	}

	public void setAddress2p(String address2p) {
		this.address2p = address2p;
	}

	public String getLandmarkp() {
		return landmarkp;
	}

	public void setLandmarkp(String landmarkp) {
		this.landmarkp = landmarkp;
	}

	public String getCountry_namep() {
		return country_namep;
	}

	public void setCountry_namep(String country_namep) {
		this.country_namep = country_namep;
	}

	public String getState_namep() {
		return state_namep;
	}

	public void setState_namep(String state_namep) {
		this.state_namep = state_namep;
	}

	public String getCity_namep() {
		return city_namep;
	}

	public void setCity_namep(String city_namep) {
		this.city_namep = city_namep;
	}

	public String getPin_codep() {
		return pin_codep;
	}

	public void setPin_codep(String pin_codep) {
		this.pin_codep = pin_codep;
	}


	public String getAddress_line_1() {
		return Address_line_1;
	}

	public void setAddress_line_1(String address_line_1) {
		Address_line_1 = address_line_1;
	}

	public String getAddress_line_2() {
		return Address_line_2;
	}

	public void setAddress_line_2(String address_line_2) {
		Address_line_2 = address_line_2;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

}
