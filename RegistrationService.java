package com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.model.User_Login_Info;
import com.model.User_Qualification;
import com.model.entity.Current_Address;
import com.model.entity.Permanent_Address;
import com.model.entity.Users;
import com.model.entity.Master_Academic_Qualification;
import com.model.entity.Master_Qualification_Entity;
import com.model.entity.Master_Skill_Update;
import com.model.entity.Master_skill;
import com.model.entity.Skill_User_Update;
import com.model.entity.User_Registration;
import com.model.entity.User_Academic;
import com.model.entity.User_Academic_Qualification;
import com.model.entity.User_Skill;


@Service
public interface RegistrationService {

	public void email_info(User_Registration user);
	public void email_update(User_Registration user, HttpSession session);
	public void skill_info(Master_skill master_skill, User_Skill user_skill, HttpSession session);
	public int email_check(String email);
	public void qualification_info(User_Academic_Qualification user_academics, Master_Academic_Qualification master_academics,HttpSession session);
	void user_update(Current_Address add, Permanent_Address add2, Users cp, HttpSession session);
	public void qualification_update(User_Academic_Qualification user_academics,
			Master_Academic_Qualification master_academics, HttpSession session);
	public List getqual(HttpSession session);
	public void academics_update(User_Academic user_academics, Master_Qualification_Entity m_academics);
	public void delete_record(int qual_id);
	public void save_address(Current_Address address, HttpSession session);
	public Current_Address address(int id);
	public List getskill(HttpSession session);
	public void skill_update(Master_Skill_Update skill_master, Skill_User_Update skill_user);
	public void user_info(Users profile,HttpSession session);
	void equaladdress(Current_Address address, HttpSession session);
	public void delete_skill_record(int skill_id);
	public void test();
	public User_Login_Info getUser_Login_Info(String name);
	public void removeReferer(String previousUrl);
	
	
	
}
