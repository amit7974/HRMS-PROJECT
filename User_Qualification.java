package com.model;

import java.util.List;

public class User_Qualification {
	private List<Integer> user_academic_qualification_id; 
	private List<String> Marks_Detail; 
	private List<String> Qualification_Description;
	private List<Integer> user_id; 
	private List<Integer> academic_qualification_id;
	private List<String> qualification_name;
	public List<Integer> getUser_academic_qualification_id() {
		return user_academic_qualification_id;
	}
	public void setUser_academic_qualification_id(List<Integer> user_academic_qualification_id) {
		this.user_academic_qualification_id = user_academic_qualification_id;
	}
	public List<String> getMarks_Detail() {
		return Marks_Detail;
	}
	public void setMarks_Detail(List<String> marks_Detail) {
		Marks_Detail = marks_Detail;
	}
	public List<String> getQualification_Description() {
		return Qualification_Description;
	}
	public void setQualification_Description(List<String> qualification_Description) {
		Qualification_Description = qualification_Description;
	}
	public List<Integer> getUser_id() {
		return user_id;
	}
	public void setUser_id(List<Integer> user_id) {
		this.user_id = user_id;
	}
	public List<Integer> getAcademic_qualification_id() {
		return academic_qualification_id;
	}
	public void setAcademic_qualification_id(List<Integer> academic_qualification_id) {
		this.academic_qualification_id = academic_qualification_id;
	}
	public List<String> getQualification_name() {
		return qualification_name;
	}
	public void setQualification_name(List<String> qualification_name) {
		this.qualification_name = qualification_name;
	}
	
	
	
	
	
	
	
}
