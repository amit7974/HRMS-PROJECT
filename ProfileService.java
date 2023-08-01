package com.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.model.Qualification_info;
import com.model.Skill_info;
import com.model.Uinfo;
import com.model.User_info;
import com.model.entity.Users;
import com.model.entity.User_Registration;

@Service
public interface ProfileService {
public Qualification_info getProfile(int user_id);
public Skill_info getSkills(int user_id);
public Users uinfo(int user_id);
public int user_id(String email, HttpSession session);
public void test();

}
