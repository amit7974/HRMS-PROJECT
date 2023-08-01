package com.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Skill_User {
	private List<Integer> user_skill_id; 
	private List<String> experience_in_month; 
	private List<Integer> user_id;
	private List<Integer> skill_id;
	private List<String> skill_name; 
	private MultipartFile file;
	public List<Integer> getUser_skill_id() {
		return user_skill_id;
	}
	public void setUser_skill_id(List<Integer> user_skill_id) {
		this.user_skill_id = user_skill_id;
	}
	public List<String> getExperience_in_month() {
		return experience_in_month;
	}
	public void setExperience_in_month(List<String> experience_in_month) {
		this.experience_in_month = experience_in_month;
	}
	
	public List<Integer> getUser_id() {
		return user_id;
	}
	public void setUser_id(List<Integer> user_id) {
		this.user_id = user_id;
	}
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
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	} 
	
	
}
