package com.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.model.FileUploadModel;

import validator.CustomFileValidator;



@Controller
public class FileUploadController implements ServletContextAware {

	private ServletContext servletContext;

	@Autowired
	CustomFileValidator customFileValidator;

	@RequestMapping(value = "/uploadFile", method = RequestMethod.GET)
	public String uploadFileFormDisplay(Model model) {
		model.addAttribute("fileUploadModel", new FileUploadModel());
		return "uploadFile";

	}

	// Handle the single file upload

	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public String uploadFileHandler(Model model,@ModelAttribute FileUploadModel fileUploadModel, BindingResult bindingResult) {

		// file handling to upload it in the server path
		MultipartFile file = fileUploadModel.getFile();
		customFileValidator.validate(fileUploadModel, bindingResult);
		if (bindingResult.hasErrors()) {
			return "uploadFile";
		}
		String fileName = file.getOriginalFilename();
		model.addAttribute("fileName", fileName);
		try {
			byte[] bytes = file.getBytes();
			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(new File(servletContext.getRealPath("/") + "/" + fileName)));
			stream.write(bytes);
			stream.close();
			return "fileUploadSuccess";
		} catch (Exception e) {
			return "fileUploadFailure";
		}

	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;

	}

}
