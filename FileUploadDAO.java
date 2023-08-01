package com.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.model.entity.Current_Address;
import com.model.entity.Permanent_Address;
import com.model.entity.Users;
import com.model.entity.Candidate_cv;
import com.model.entity.UploadFile;
@Service
public interface FileUploadDAO {

	public void saveFile(UploadFile uploadFile,HttpSession session);
	public void saveName(Candidate_cv candidate_cv,HttpSession session);
	public int status();
	void updatefileName(Candidate_cv candidate_cv, HttpSession session);
	void saveUploadFile(UploadFile uploadFile, HttpSession session);
	
}
