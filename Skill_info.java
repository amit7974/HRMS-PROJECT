package com.model;

import java.util.ArrayList;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class Skill_info {
	
	private ArrayList<String> skill_name;
	
	private ArrayList<String> experience_in_month;
	
	private MultipartFile file;
	

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public ArrayList<String> getSkill_name() {
		return skill_name;
	}
	public void setSkill_name(ArrayList<String> skill_name) {
		this.skill_name = skill_name;
	}

	public ArrayList<String> getExperience_in_month() {
		return experience_in_month;
	}

	public void setExperience_in_month(ArrayList<String> experience_in_month) {
		this.experience_in_month = experience_in_month;
	}
	
	
	
	
	
	
	
	
}
