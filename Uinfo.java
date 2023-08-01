package com.model;

import java.util.Date;

import javax.persistence.Table;

public class Uinfo {

	private Date dob;

	private int current_address;
	
	private int permanent_address;

	private int users_id;

	private String gender;

	private String phone;

	private String first_name;
	private String middle_name;
	private String last_name;
	public int getCurrent_address() {
		return current_address;
	}

	public void setCurrent_address(int current_address) {
		this.current_address = current_address;
	}

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

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	

	public int getPermanent_address() {
		return permanent_address;
	}

	public void setPermanent_address(int permanent_address) {
		this.permanent_address = permanent_address;
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

	



}
