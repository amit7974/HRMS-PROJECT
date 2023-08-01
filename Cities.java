package com.model;

public class Cities {
	private int city_id;
	private String city_name;
	private String state_name;
	private int country_id;
	private int state_id;
	public int getCity_id() {
		return city_id;
	}
	public void setCity_id(int city_id) {
		this.city_id = city_id;
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
	public int getCountry_id() {
		return country_id;
	}
	public void setCountry_id(int country_id) {
		this.country_id = country_id;
	}
	
	public int getState_id() {
		return state_id;
	}
	public void setState_id(int state_id) {
		this.state_id = state_id;
	}
	public Cities() {
	}
	public Cities(int city_id, String city_name, String state_name, int country_id, int state_id) {
		super();
		this.city_id = city_id;
		this.city_name = city_name;
		this.state_name = state_name;
		this.country_id = country_id;
		this.state_id = state_id;
	}
	@Override
	public String toString() {
		return "Cities [city_id=" + city_id + ", city_name=" + city_name + ", state_name=" + state_name
				+ ", country_id=" + country_id + ", state_id=" + state_id + "]";
	}
	
	
	
}
