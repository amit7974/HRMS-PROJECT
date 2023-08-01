package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


public class Cv {
	
	
	
	private String cv_name;
	
	public String getCv_name() {
		return cv_name;
	}
	public void setCv_name(String cv_name) {
		this.cv_name = cv_name;
	}
	public Cv(String cv_name) {
		super();
		this.cv_name = cv_name;
	}
	
	public Cv()
	{
		
	}
	
	
	
	
	
}
