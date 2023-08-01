package com.model;

import java.util.ArrayList;
import java.util.List;

public class Table_Data {
public List<Integer> user_id;
public List<String> email;
public List<String> first_name;
public List<String> last_name;
public List<List<String>> qualification_name;
public List<List<String>> skill_name;
public int total_pages;

public List<List<String>> getQualification_name() {
	return qualification_name;
}
public void setQualification_name(List<List<String>> ql) {
	this.qualification_name = ql;
}
public List<List<String>> getSkill_name() {
	return skill_name;
}
public void setSkill_name(List<List<String>> sk) {
	this.skill_name = sk;
}
public List<Integer> getUser_id() {
	return user_id;
}
public void setUser_id(List<Integer> user_id) {
	this.user_id = user_id;
}
public List<String> getEmail() {
	return email;
}
public void setEmail(List<String> email) {
	this.email = email;
}
public List<String> getFirst_name() {
	return first_name;
}
public void setFirst_name(List<String> first_name) {
	this.first_name = first_name;
}
public List<String> getLast_name() {
	return last_name;
}
public void setLast_name(List<String> last_name) {
	this.last_name = last_name;
}
public int getTotal_pages() {
	return total_pages;
}
public void setTotal_pages(int total_pages) {
	this.total_pages = total_pages;
}



}
