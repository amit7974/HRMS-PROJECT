package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.FileUploadDAO;
 
/**
 * Handles requests for the file upload page.
 */
@Controller
public class HomeController {
    @Autowired
    private FileUploadDAO fileUploadDao;
 
    @RequestMapping(value = "/upload", method = RequestMethod.GET)
    public String showUploadForm(HttpServletRequest request) {
        return "email";
    }
     
    @RequestMapping(value = "/doUpload", method = RequestMethod.GET)
    public String handleFileUpload(HttpServletRequest request
           //, @RequestParam ("fileUpload")CommonsMultipartFile fileUpload
    		) throws Exception 
    		{
          
    	
    	
    	fileUploadDao.status();
    	
		/*
		 * UploadFile uploadFile = new UploadFile();
		 * uploadFile.setFileName(fileUpload.getOriginalFilename());
		 * uploadFile.setData(fileUpload.getBytes()); FileOutputStream file=new
		 * FileOutputStream("G:\\"+fileUpload.getOriginalFilename()+"");
		 * file.write(fileUpload.getBytes()); file.close();
		 * 
		 */
        
       // fileUploadDao.save(uploadFile);       
      /*  if (fileUpload != null && fileUpload.length > 0) {
            for (CommonsMultipartFile aFile : fileUpload){
                  
                System.out.println("Saving file: " + aFile.getOriginalFilename());
                 
                UploadFile uploadFile = new UploadFile();
                uploadFile.setFileName(aFile.getOriginalFilename());
                uploadFile.setData(aFile.getBytes());
                
                fileUploadDao.save(uploadFile);               
            }
        }*/
  
        return "Success";
    }  
    
    @RequestMapping(value = "/assign2", method = RequestMethod.GET)
    public String assign2(HttpServletRequest request) {
        return "assign2";
    }
    
    
    @RequestMapping(value = "/office_details", method = RequestMethod.GET)
    public String office_details(HttpServletRequest request) {
       return "office_details";
    }
    
    
    @RequestMapping(value = "/home", method = RequestMethod.GET)
   public String home(HttpServletRequest request) {
       return "home";

}
    
    @RequestMapping(value = "/add_job_vacancy_form", method = RequestMethod.GET)
    public String add_job_vacancy_form(HttpServletRequest request) {
        return "add_job_vacancy_form";


    }
    
    @RequestMapping(value = "/submit_job_vacancy", method = RequestMethod.GET)
    public String submit_job_vacancy(HttpServletRequest request) {
        return "submit_job_vacancy";


    }
    
    @RequestMapping(value = "/update_company", method = RequestMethod.GET)
    public String update_comapny(HttpServletRequest request) {
        return "update_company";
    
    
}
    
    @RequestMapping(value = "/base", method = RequestMethod.GET)
    public String base(HttpServletRequest request) {
        return "base";
    
    }
    
    @RequestMapping(value = "/own", method = RequestMethod.GET)
    public String own(HttpServletRequest request) {
        return "own";
    
    }
    
}
