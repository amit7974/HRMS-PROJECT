package com.model;

import java.util.List;

public class Skill_Master {

	private List<Integer>skill_id; 
	private List<String> skill_name; 
	private List<Integer> user_id;
	public List<Integer> getSkill_id() {
		return skill_id;
	}
	public void setSkill_id(List<Integer> skill_id) {
		this.skill_id = skill_id;
	}
	public List<String> getSkill_name() {
		return skill_name;
	}
	public void setSkill_name(List<String> skill_name) {
		this.skill_name = skill_name;
	}
	public List<Integer> getUser_id() {
		return user_id;
	}
	public void setUser_id(List<Integer> user_id) {
		this.user_id = user_id;
	}
	
	
}
