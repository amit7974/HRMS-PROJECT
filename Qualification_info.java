package com.model;

import java.util.ArrayList;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Qualification_info {
	
	private ArrayList<String> qualification_name;
	
	
	private ArrayList<String> Qualification_Description;
	
	
	private ArrayList<String> Marks_Detail;
	
	
	

	public ArrayList<String> getQualification_name() {
		return qualification_name;
	}

	public void setQualification_name(ArrayList<String> qualification_name) {
		this.qualification_name = qualification_name;
	}
	
	public ArrayList<String> getQualification_Description() {
		return Qualification_Description;
	}

	public void setQualification_Description(ArrayList<String> qualification_Description) {
		Qualification_Description = qualification_Description;
	}

	public ArrayList<String> getMarks_Detail() {
		return Marks_Detail;
	}

	public void setMarks_Detail(ArrayList<String> marks_Detail) {
		Marks_Detail = marks_Detail;
	}

	
	
}
