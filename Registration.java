package com.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.db.conn.DBcon;
import com.google.gson.Gson;
import com.model.Academic_master;
import com.model.Cv;
import com.model.Qualification_info;
import com.model.Skill_Master;
import com.model.Skill_User;
import com.model.Skill_info;
import com.model.User_Qualification;
import com.model.User_info;
import com.model.entity.Candidate_cv;
import com.model.entity.Current_Address;
import com.model.entity.Master_Academic_Qualification;
import com.model.entity.Master_Qualification_Entity;
import com.model.entity.Master_Skill_Update;
import com.model.entity.Master_skill;
import com.model.entity.Permanent_Address;
import com.model.entity.Skill_User_Update;
import com.model.entity.UploadFile;
import com.model.entity.User_Academic;
import com.model.entity.User_Academic_Qualification;
import com.model.entity.User_Registration;
import com.model.entity.User_Skill;
import com.model.entity.Users;
import com.service.DropDownService;
import com.service.FileUploadDAO;
import com.service.ProfileService;
import com.service.RegistrationService;
import com.utils.GlobalConstant;

import validator.AgeValidator;
import validator.FileValidatorUpdate;
import validator.QualificationUpdateValidation;
import validator.SkillValidationUpdate;

@Controller
@RequestMapping(value = { GlobalConstant.BLANK, GlobalConstant.DEMO })
public class Registration {

	@Autowired
	DropDownService dropdown;

	@Autowired
	RegistrationService registrationService;

	@Autowired
	private FileUploadDAO fileUploadDao;

	@Autowired
	SkillValidationUpdate skillValidation;

	@Autowired
	ProfileService profileService;

	@Value("${file.path}")
	String filepath;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	FileValidatorUpdate customFileValidator;

	@Autowired
	AgeValidator ageValidator;

	@Autowired
	QualificationUpdateValidation qualificationValidation;

	@Autowired
	DBcon dBcon;

//LOADING Home Page
	@RequestMapping(method = RequestMethod.GET)
	public String home(@ModelAttribute(GlobalConstant.USER) User_Registration user, HttpSession session) {
		return "index";
	}

	//LOADING USER EMAIL REGISTER PAGE 
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String first_page(@ModelAttribute(GlobalConstant.USER) User_Registration user,HttpSession session) {
			session.invalidate();
			return "email_info";
		
	
		}
	@RequestMapping(value = "register2", method = RequestMethod.POST)
	public String first_page2(@ModelAttribute(GlobalConstant.USER) User_Registration user,@RequestParam("user_type")String user_type) {
	if(user_type.equals("employee")) {
		return "redirect:/emp/emp_register";
	}
			return "email_info";
		
	}
	//SAVING USER EMAIL AND PASSWORD
	@RequestMapping(value = "user_info", method = RequestMethod.POST)
	public String index(ModelMap modelMap, @Valid @ModelAttribute(GlobalConstant.USER) User_Registration user,
			BindingResult result, HttpSession session, RedirectAttributes ra) {

		if (result.hasErrors()) {
			return "redirect:/email_info";
		}

		modelMap.addAttribute("uinfo", new User_info());

		session.setAttribute(GlobalConstant.USER, user);
		session.setAttribute("pas", user.getPassword());
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		registrationService.email_info(user);
		dropdown.conn(dBcon.getCon());
		modelMap.put(GlobalConstant.COUNTRIES, dropdown.getAllCountry());
		return "redirect:/user_details_page";
	}
	//LOADING USER DETAILS PAGES
	@GetMapping(value = "/user_details_page")
	public String user_details_page(ModelMap modelMap,@ModelAttribute("uinfo") User_info uinfo)
	{
		dropdown.conn(dBcon.getCon());
		modelMap.put(GlobalConstant.COUNTRIES, dropdown.getAllCountry());
		List<String> countries=dropdown.getCountries();
		modelMap.addAttribute("country", countries);
		return "user_edit";
	}
	
	

	//LOADING EMAIL UPDATE PAGE
	@RequestMapping(value = "registerback", method = RequestMethod.GET)
	public String registerback(@ModelAttribute(GlobalConstant.USER) User_Registration user) {

		return "email_edit";
	}
	//SAVING EDITED EMAIL INFORMATION AND LOADING USERS DETAILS PAGE
	@RequestMapping(value = "email_edit", method = RequestMethod.POST)
	public String email_edit(ModelMap modelMap, @Valid @ModelAttribute(GlobalConstant.USER) User_Registration user,
			BindingResult result, HttpSession session, RedirectAttributes ra) {
		if (result.hasErrors()) {
			ra.addFlashAttribute("org.springframework.validation.BindingResult.user", result);
			return "redirect:/email_info";
		}

		modelMap.addAttribute("uinfo", new User_info());

		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		registrationService.email_update(user, session);
		dropdown.conn(dBcon.getCon());
		modelMap.put(GlobalConstant.COUNTRIES, dropdown.getAllCountry());
		session.removeAttribute("user");
		session.setAttribute(GlobalConstant.USER, user);
		return "user_edit";
	}

	//LOADING USERS DETAILS PAGE
	@RequestMapping(value = "user_back", method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("unchecked", 0);
		 if(!modelMap.containsAttribute("uinfo")) 
		 {
			 modelMap.addAttribute("uinfo", new User_info());
		 }
		
		dropdown.conn(dBcon.getCon());
		modelMap.put(GlobalConstant.COUNTRIES, dropdown.getAllCountry());
		List<String> countries=dropdown.getCountries();
		modelMap.addAttribute("country", countries);
		return "user_edit";
	}

	//SAVING AND UPDATING USERS DETAILS
	@RequestMapping(value = "user_update", method = RequestMethod.POST)
	public String second_page(ModelMap modelMap, Model model, @Valid @ModelAttribute("uinfo") User_info uinfo,
			BindingResult result, Current_Address address, Permanent_Address address2, HttpSession session,
			RedirectAttributes ra) throws IOException {

		ageValidator.validate(uinfo, result);

		if (result.hasErrors())

		{
			System.out.println(result.getFieldErrors());
			ra.addFlashAttribute("org.springframework.validation.BindingResult.uinfo", result);
			ra.addFlashAttribute("uinfo", uinfo);
			return "redirect:/user_back";
		}

		Users cp = new Users();
		cp.setCurrent_Address(address);
		if (address.getAddress_type().equals("c")) {

			cp.setPermanent_Address(address2);
		}
		cp.setFirst_name(uinfo.getFirst_name());
		cp.setMiddle_name(uinfo.getMiddle_name());
		cp.setLast_name(uinfo.getLast_name());
		cp.setDob(uinfo.getDob());
		cp.setGender(uinfo.getGender());
		cp.setPhone(uinfo.getPhone());

		session.setAttribute("profile", uinfo);
		session.setAttribute("address", address);
		session.removeAttribute("address2");
		session.setAttribute("address2", address2);
		registrationService.user_update(address, address2, cp, session);

		if (address.getAddress_type().equals("pc")) {

			registrationService.equaladdress(address, session);

		}

		// model.addAttribute("qual_info", new Qualification_info());
		modelMap.addAttribute("qual_info", new User_Qualification());
		return "redirect:/qual_back";
	}
	
	
	//LOADING QUALIFICATION INFORMATION PAGE AND DYNAMIC CONTENT
	@RequestMapping(value = "qual_back", method = RequestMethod.GET)
	public String qual(ModelMap modelMap, HttpSession session) {

		List list = registrationService.getqual(session);

		User_Qualification uq = new User_Qualification();
		Academic_master mq = new Academic_master();
		List<Integer> u_academic_qualification_id = new ArrayList<Integer>();
		List<String> marks = new ArrayList<String>();
		List<String> description = new ArrayList<String>();
		List<Integer> uid = new ArrayList<Integer>();
		List<Integer> aca_qualification_id = new ArrayList<Integer>();
		List<String> qualification_name = new ArrayList<String>();

		for (int i = 0; i < list.size(); i++) {
			Object[] rows = (Object[]) list.get(i);

			int user_academic_qualification_id = (int) rows[0];
			String Marks_Detail = (String) rows[1];
			String Qualification_Description = (String) rows[2];
			int academic_qualification_id = (int) rows[3];
			String qual_name = (String) rows[4];
			int user_id = (int) rows[5];

			u_academic_qualification_id.add(user_academic_qualification_id);
			marks.add(Marks_Detail);
			description.add(Qualification_Description);
			uid.add(user_id);
			aca_qualification_id.add(academic_qualification_id);
			qualification_name.add(qual_name);

		}

		// USER
		uq.setAcademic_qualification_id(aca_qualification_id);
		uq.setMarks_Detail(marks);
		uq.setQualification_Description(description);
		uq.setUser_academic_qualification_id(u_academic_qualification_id);
		uq.setUser_id(uid);
		uq.setQualification_name(qualification_name);
		// MASTER
		mq.setAcademic_qualification_id(aca_qualification_id);
		mq.setQualification_name(qualification_name);
		mq.setUser_id(uid);

		session.setAttribute("user_academics", uq);

		// Qualification_info info=(Qualification_info)
		// session.getAttribute("qual_info");
		int size = uq.getQualification_name().size();
		modelMap.addAttribute("qual_size", size);
		modelMap.addAttribute("qual_info", new User_Qualification());
		dropdown.conn(dBcon.getCon());
		modelMap.put(GlobalConstant.COUNTRIES, dropdown.getAllCountry());
		return "qualification_edit";
	}

	//SAVING AND UPDATING QUALIFICATION INFORMATION
	@RequestMapping(value = "qual_update", method = RequestMethod.POST)
	public String third_page(ModelMap modelMap, @Valid @ModelAttribute("qual_info") User_Qualification qual_info,
			BindingResult result, HttpSession session, RedirectAttributes ra) throws IOException

	{
		qualificationValidation.validate(qual_info, result);
		if (result.hasErrors()) {
			ra.addFlashAttribute("org.springframework.validation.BindingResult.qual_info", result);
			return "redirect:/qualification_edit";

		}
		qual_info.getMarks_Detail().removeAll(Collections.singleton(null));
		qual_info.getQualification_Description().removeAll(Collections.singleton(null));
		qual_info.getQualification_name().removeAll(Collections.singleton(null));
		session.removeAttribute("qual_info");
		session.setAttribute("qual_info", qual_info);
		modelMap.addAttribute(GlobalConstant.SKILL, new Skill_info());
		User_Academic user_academics = new User_Academic();
		Master_Qualification_Entity m_academics = new Master_Qualification_Entity();

		User_Academic_Qualification academic = new User_Academic_Qualification();
		Master_Academic_Qualification master_academics = new Master_Academic_Qualification();

		List<String> ls = qual_info.getQualification_name();
		List<String> bs = qual_info.getQualification_Description();
		List<String> cs = qual_info.getMarks_Detail();
		List<Integer> u_academic_qualification_id = qual_info.getUser_academic_qualification_id();
		List<Integer> uid = qual_info.getUser_id();
		List<Integer> aca_qualification_id = qual_info.getAcademic_qualification_id();

		int size = ls.size();

		for (int i = 0; i < ls.size(); i++) {

			if (uid.isEmpty() || uid.get(i) == null) {
				master_academics.setQualification_name(ls.get(i));
				academic.setQualification_Description(bs.get(i));
				academic.setMarks_Detail(cs.get(i));
				registrationService.qualification_info(academic, master_academics, session);
			} else {
				// MASTER
				m_academics.setQualification_name(ls.get(i));
				m_academics.setUser_id(uid.get(i));
				m_academics.setAcademic_qualification_id(aca_qualification_id.get(i));
				// USER
				user_academics.setAcademic_qualification_id(aca_qualification_id.get(i));
				user_academics.setUser_academic_qualification_id(u_academic_qualification_id.get(i));
				user_academics.setQualification_Description(bs.get(i));
				user_academics.setMarks_Detail(cs.get(i));
				registrationService.academics_update(user_academics, m_academics);
			}

		}

		return "redirect:/skill_back";

	}

	
	//LOADING SKILL PAGE AND DYNAMIC CONTENTS
	@RequestMapping(value = "skill_back", method = RequestMethod.GET)
	public String skill(ModelMap modelMap, HttpSession session) {

		List list = registrationService.getskill(session);

		Skill_User usk = new Skill_User();
		Skill_Master msk = new Skill_Master();

		List<Integer> user_skill_id = new ArrayList<Integer>();
		List<String> experience_in_month = new ArrayList<String>();
		List<Integer> uid = new ArrayList<Integer>();
		List<Integer> skill_id = new ArrayList<Integer>();
		List<String> skill_name = new ArrayList<String>();

		for (int i = 0; i < list.size(); i++) {
			Object[] rows = (Object[]) list.get(i);

			int u_skill_id = (int) rows[0];
			String exp_in_month = (String) rows[1];
			String sk_name = (String) rows[2];
			int sk_id = (int) rows[3];
			int user_id = (int) rows[4];

			user_skill_id.add(u_skill_id);
			experience_in_month.add(exp_in_month);
			uid.add(user_id);
			skill_id.add(sk_id);
			skill_name.add(sk_name);

		}

		// USER
		usk.setSkill_id(skill_id);
		usk.setExperience_in_month(experience_in_month);
		usk.setUser_skill_id(user_skill_id);
		usk.setUser_id(uid);
		usk.setSkill_name(skill_name);
		// MASTER
		msk.setSkill_id(skill_id);
		msk.setSkill_name(skill_name);
		msk.setUser_id(uid);

		session.setAttribute("sk", usk);

		// Qualification_info info=(Qualification_info)
		// session.getAttribute("qual_info");
		int size = usk.getSkill_name().size();
		modelMap.addAttribute("skill_size", size);
		modelMap.addAttribute("skill", new Skill_User());
		dropdown.conn(dBcon.getCon());
		modelMap.put(GlobalConstant.COUNTRIES, dropdown.getAllCountry());
		return "skill_edit";
	}

	//SAVING AND UPDATING SKILLS
	@RequestMapping(value = "skill_update", method = RequestMethod.POST)
	public String fourth_page(@Valid @ModelAttribute("skill") Skill_User skill, BindingResult result,
			@ModelAttribute("cv") Cv cv, HttpSession session, RedirectAttributes ra) throws IOException {
		Candidate_cv candidate_cv = new Candidate_cv();
		candidate_cv.setCv_name(cv.getCv_name());
		MultipartFile file2 = skill.getFile();
		skillValidation.validate(skill, result);
		customFileValidator.validate(skill, result);
		if (result.hasErrors()) {

			ra.addFlashAttribute("org.springframework.validation.BindingResult.skill", result);
			return "redirect:/skill_info";
		}

		if (fileUploadDao.status() == 1) {
			if (file2 != null) {

				UploadFile uploadFile = new UploadFile();
				uploadFile.setFileName(file2.getOriginalFilename());
				uploadFile.setData(file2.getBytes());
				fileUploadDao.saveUploadFile(uploadFile, session);

			}
		} else {
			byte[] data = file2.getBytes();
			String file_name = file2.getOriginalFilename();

			FileOutputStream file = new FileOutputStream(filepath + file_name + "");
			file.write(data);

			candidate_cv.setCv_name(file_name);
			fileUploadDao.updatefileName(candidate_cv, session);

		}

		skill.getExperience_in_month().removeAll(Collections.singleton(null));
		skill.getSkill_name().removeAll(Collections.singleton(null));

		session.removeAttribute("skill_info");
		session.setAttribute("skill_info", skill);
		Skill_User_Update skill_user = new Skill_User_Update();
		Master_Skill_Update skill_master = new Master_Skill_Update();

		Master_skill master_skill = new Master_skill();
		User_Skill user_skill = new User_Skill();

		List<String> ls = skill.getSkill_name();
		List<String> cs = skill.getExperience_in_month();
		List<Integer> user_skill_id = skill.getUser_skill_id();
		List<Integer> uid = skill.getUser_id();
		List<Integer> skill_id = skill.getSkill_id();

		int size = ls.size();

		for (int i = 0; i < ls.size(); i++) {

			if (uid.isEmpty() || uid.get(i) == null) {
				master_skill.setSkill_name(ls.get(i));
				user_skill.setExperience_in_month(cs.get(i));
				registrationService.skill_info(master_skill, user_skill, session);
			} else {
				// MASTER
				skill_master.setSkill_name(ls.get(i));
				skill_master.setUser_id(uid.get(i));
				skill_master.setSkill_id(skill_id.get(i));
				// USER
				skill_user.setSkill_id(skill_id.get(i));
				skill_user.setUser_skill_id(user_skill_id.get(i));
				skill_user.setExperience_in_month(cs.get(i));

				registrationService.skill_update(skill_master, skill_user);
			}

		}
		return "redirect:/finish";

	}
	@GetMapping("/finish")
	public String registration_successful()
	{
		return "action";
	}
	//LOADING PROFILE PAGE
		@RequestMapping(value = "profile_page", method = RequestMethod.GET)
		public String profile(ModelMap model, HttpSession session) {
			User_Registration use = (User_Registration) session.getAttribute("user");

			String email = use.getUser_name();
			int user_id = profileService.user_id(email, session);

			Users ulist = profileService.uinfo(user_id);
			Qualification_info qinfo = profileService.getProfile(user_id);
			Skill_info sinfo = profileService.getSkills(user_id);

			model.addAttribute("qinfo", qinfo);
			model.addAttribute("sinfo", sinfo);
			model.addAttribute("ulist", ulist);
			model.addAttribute("us", email);

			User_info uinfo = new User_info();
			uinfo.setDob(ulist.getDob());
			uinfo.setGender(ulist.getGender());
			uinfo.setPhone(ulist.getPhone());
			uinfo.setFirst_name(ulist.getFirst_name());
			uinfo.setMiddle_name(ulist.getMiddle_name());
			uinfo.setLast_name(ulist.getLast_name());
			uinfo.setAddress_line_1(ulist.getCurrent_Address().getAddress_line_1());
			uinfo.setAddress_line_2(ulist.getCurrent_Address().getAddress_line_2());
			uinfo.setCity_name(ulist.getCurrent_Address().getCity_name());
			uinfo.setCountry_name(ulist.getCurrent_Address().getCountry_name());
			uinfo.setLandmark(ulist.getCurrent_Address().getLandmark());
			uinfo.setPin_code(ulist.getCurrent_Address().getPin_code());
			uinfo.setState_name(ulist.getCurrent_Address().getState_name());

			uinfo.setAddressp(ulist.getPermanent_Address().getAddressp());
			uinfo.setAddress2p(ulist.getPermanent_Address().getAddress2p());
			uinfo.setCity_namep(ulist.getPermanent_Address().getCity_namep());
			uinfo.setCountry_namep(ulist.getPermanent_Address().getCountry_namep());
			uinfo.setLandmarkp(ulist.getPermanent_Address().getLandmarkp());
			uinfo.setPin_codep(ulist.getPermanent_Address().getPin_codep());
			uinfo.setState_namep(ulist.getPermanent_Address().getState_namep());
			Current_Address address = ulist.getCurrent_Address();
			Permanent_Address address2 = ulist.getPermanent_Address();
			session.setAttribute("address", address);
			session.setAttribute("profile", uinfo);

			session.setAttribute("address2", address2);
			session.setAttribute("user_academics", qinfo);
			session.setAttribute("sk", sinfo);

			return "profile_page";

		}
	
	//AJAX METHODS
	
	
	//LOADING STATE BY COUNTRYID
	@ResponseBody
	@RequestMapping(value = GlobalConstant.LOADSTATESBYCOUNTRY_ID, method = RequestMethod.GET)
	public String loadStatesByCountry(@PathVariable(GlobalConstant.ID) String id) {
		Gson gson = new Gson();
		return gson.toJson(dropdown.getStateByCountryId(id));
	}
	
	//LOADING CITY BY STATEID
	@ResponseBody
	@RequestMapping(value = GlobalConstant.LOADCITIESBYSTATE_ID, method = RequestMethod.GET)
	public String loadCitiesByState(@PathVariable(GlobalConstant.ID) String id) {
		Gson gson = new Gson();
		return gson.toJson(dropdown.getCityByStateId(id));
	}
	//CHECKING EMAIL ALREADY EXISTS OR NOT
	@ResponseBody
	@RequestMapping(value = "email/{email:.+}", method = RequestMethod.GET)
	public String verify(@PathVariable("email") String email) {

		int result = registrationService.email_check(email);
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	//DELETING QUALIFICATION BY ID
	@RequestMapping(value = "qualdelete/{qualremove}", method = RequestMethod.POST)
	public void qualdelete(@PathVariable("qualremove") String qual_id) {
		System.out.println("called");
		if (!qual_id.equals("invalid")) {

			registrationService.delete_record(Integer.parseInt(qual_id));

		}

	}
	//DELETING SKILL BY ID
	@RequestMapping(value = "skilldelete/{skillremove}", method = RequestMethod.POST)
	public void skilldelete(@PathVariable("skillremove") String skill_id) {

		if (!skill_id.equals("invalid")) {

			registrationService.delete_skill_record(Integer.parseInt(skill_id));

		}

	}
}
