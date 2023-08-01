package com.model;

public class User_Login_Info {

	private String first_name;
	private String last_name;
	private String user_type;
	private int users_id;
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
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public int getUsers_id() {
		return users_id;
	}
	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}
	@Override
	public String toString() {
		return "User_Login_Info [first_name=" + first_name + ", last__name=" + last_name + ", user_type=" + user_type
				+ ", users_id=" + users_id + "]";
	}
	
	
}
