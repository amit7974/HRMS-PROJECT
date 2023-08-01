/*
 * package com.controller;
 * 
 * import java.io.FileOutputStream; import java.io.IOException; import
 * java.util.ArrayList; import java.util.Collections; import java.util.List;
 * 
 * import javax.servlet.ServletContext; import javax.servlet.http.HttpSession;
 * import javax.validation.Valid;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.beans.factory.annotation.Value; import
 * org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import org.springframework.ui.ModelMap; import
 * org.springframework.validation.BindingResult; import
 * org.springframework.web.bind.annotation.ModelAttribute; import
 * org.springframework.web.bind.annotation.PathVariable; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.multipart.MultipartFile; import
 * org.springframework.web.servlet.mvc.support.RedirectAttributes;
 * 
 * import com.db.conn.DBcon; import com.model.Academic_master; import
 * com.model.Cv; import com.model.Skill_Master; import com.model.Skill_User;
 * import com.model.Skill_info; import com.model.User_Qualification; import
 * com.model.User_info; import com.model.entity.Candidate_cv; import
 * com.model.entity.Current_Address; import
 * com.model.entity.Master_Academic_Qualification; import
 * com.model.entity.Master_Qualification_Entity; import
 * com.model.entity.Master_Skill_Update; import com.model.entity.Master_skill;
 * import com.model.entity.Permanent_Address; import
 * com.model.entity.Skill_User_Update; import com.model.entity.UploadFile;
 * import com.model.entity.User_Academic; import
 * com.model.entity.User_Academic_Qualification; import
 * com.model.entity.User_Registration; import com.model.entity.User_Skill;
 * import com.model.entity.Users; import com.service.DropDownService; import
 * com.service.FileUploadDAO; import com.service.ProfileService; import
 * com.service.RegistrationService; import com.utils.GlobalConstant;
 * 
 * import validator.AgeValidator; import validator.FileValidatorUpdate; import
 * validator.QualificationUpdateValidation; import
 * validator.SkillValidationUpdate;
 * 
 * 
 * @Controller
 * 
 * @RequestMapping(value = { GlobalConstant.BLANK, GlobalConstant.DEMO }) public
 * class RegistrationEdit {
 * 
 * @Autowired DropDownService dropdown;
 * 
 * @Autowired RegistrationService registrationService;
 * 
 * @Autowired private FileUploadDAO fileUploadDao;
 * 
 * @Autowired SkillValidationUpdate skillValidation;
 * 
 * @Autowired ProfileService profileService;
 * 
 * @Value("${file.path}") String filepath;
 * 
 * @Autowired BCryptPasswordEncoder bCryptPasswordEncoder;
 * 
 * private ServletContext servletContext;
 * 
 * @Autowired FileValidatorUpdate customFileValidator;
 * 
 * @Autowired AgeValidator ageValidator;
 * 
 * @Autowired QualificationUpdateValidation qualificationValidation;
 * 
 * @Autowired DBcon dBcon;
 * 
 * 
 * @RequestMapping(value = "registerback",method = RequestMethod.GET) public
 * String registerback(@ModelAttribute(GlobalConstant.USER) User_Registration
 * user) {
 * 
 * return "email_edit"; }
 * 
 * @RequestMapping(value = "email_edit",method = RequestMethod.POST) public
 * String email_edit(ModelMap
 * modelMap, @Valid @ModelAttribute(GlobalConstant.USER) User_Registration user,
 * BindingResult result, HttpSession session,RedirectAttributes ra) { if
 * (result.hasErrors()) {
 * ra.addFlashAttribute("org.springframework.validation.BindingResult.user",
 * result); return "redirect:/email_info"; }
 * 
 * modelMap.addAttribute("uinfo", new User_info());
 * 
 * user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
 * registrationService.email_update(user,session);
 * dropdown.conn(dBcon.getCon()); modelMap.put(GlobalConstant.COUNTRIES,
 * dropdown.getAllCountry()); session.removeAttribute("user");
 * session.setAttribute(GlobalConstant.USER, user); return "user_edit"; }
 * 
 * 
 * 
 * 
 * 
 * @RequestMapping(value = "user_back", method = RequestMethod.GET) public
 * String index(ModelMap modelMap) { modelMap.addAttribute("unchecked", 0);
 * modelMap.addAttribute("uinfo", new User_info());
 * dropdown.conn(dBcon.getCon()); modelMap.put(GlobalConstant.COUNTRIES,
 * dropdown.getAllCountry()); return "user_edit"; }
 * 
 * @RequestMapping(value = "user_update", method = RequestMethod.POST) public
 * String second_page(ModelMap modelMap, Model model,
 * 
 * @Valid @ModelAttribute("uinfo") User_info uinfo, BindingResult result,
 * Current_Address address,Permanent_Address address2, HttpSession
 * session,RedirectAttributes ra) throws IOException {
 * 
 * 
 * ageValidator.validate(uinfo, result);
 * 
 * if (result.hasErrors())
 * 
 * {
 * 
 * ra.addFlashAttribute("org.springframework.validation.BindingResult.uinfo",
 * result); return "redirect:/user_back"; }
 * 
 * Users cp=new Users(); cp.setCurrent_Address(address);
 * if(address.getAddress_type().equals("c")) {
 * 
 * cp.setPermanent_Address(address2); } cp.setFirst_name(uinfo.getFirst_name());
 * cp.setMiddle_name(uinfo.getMiddle_name());
 * cp.setLast_name(uinfo.getLast_name()); cp.setUser_type(uinfo.getUser_type());
 * cp.setDob(uinfo.getDob()); cp.setGender(uinfo.getGender());
 * cp.setPhone(uinfo.getPhone());
 * 
 * 
 * 
 * 
 * 
 * 
 * session.setAttribute("profile", uinfo); session.setAttribute("address",
 * address); session.removeAttribute("address2");
 * session.setAttribute("address2", address2);
 * registrationService.user_update(address,address2,cp, session);
 * 
 * if(address.getAddress_type().equals("pc")) {
 * 
 * registrationService.equaladdress(address, session);
 * 
 * }
 * 
 * //model.addAttribute("qual_info", new Qualification_info());
 * modelMap.addAttribute("qual_info", new User_Qualification()); return
 * "redirect:/qual_back"; }
 * 
 * 
 * @RequestMapping(value = "qual_back", method = RequestMethod.GET) public
 * String qual(ModelMap modelMap,HttpSession session) {
 * 
 * List list=registrationService.getqual(session);
 * 
 * 
 * User_Qualification uq = new User_Qualification(); Academic_master mq=new
 * Academic_master(); List<Integer>u_academic_qualification_id=new
 * ArrayList<Integer>(); List<String>marks=new ArrayList<String>();
 * List<String>description=new ArrayList<String>(); List<Integer>uid=new
 * ArrayList<Integer>(); List<Integer>aca_qualification_id=new
 * ArrayList<Integer>(); List<String>qualification_name=new ArrayList<String>();
 * 
 * for(int i=0;i<list.size();i++) { Object []rows = (Object[]) list.get(i);
 * 
 * int user_academic_qualification_id= (int) rows[0]; String Marks_Detail=
 * (String) rows[1]; String Qualification_Description= (String) rows[2]; int
 * academic_qualification_id= (int) rows[3]; String qual_name=(String) rows[4];
 * int user_id= (int) rows[5];
 * 
 * 
 * 
 * 
 * u_academic_qualification_id.add(user_academic_qualification_id);
 * marks.add(Marks_Detail); description.add(Qualification_Description);
 * uid.add(user_id); aca_qualification_id.add(academic_qualification_id);
 * qualification_name.add(qual_name);
 * 
 * 
 * 
 * }
 * 
 * //USER uq.setAcademic_qualification_id(aca_qualification_id);
 * uq.setMarks_Detail(marks); uq.setQualification_Description(description);
 * uq.setUser_academic_qualification_id(u_academic_qualification_id);
 * uq.setUser_id(uid); uq.setQualification_name(qualification_name); //MASTER
 * mq.setAcademic_qualification_id(aca_qualification_id);
 * mq.setQualification_name(qualification_name); mq.setUser_id(uid);
 * 
 * session.setAttribute("user_academics", uq);
 * 
 * 
 * 
 * //Qualification_info info=(Qualification_info)
 * session.getAttribute("qual_info"); int
 * size=uq.getQualification_name().size(); modelMap.addAttribute("qual_size",
 * size); modelMap.addAttribute("qual_info", new User_Qualification());
 * dropdown.conn(dBcon.getCon()); modelMap.put(GlobalConstant.COUNTRIES,
 * dropdown.getAllCountry()); return "qualification_edit"; }
 * 
 * 
 * 
 * //UPDATING QUALIFICATION
 * 
 * @RequestMapping(value = "qual_update", method = RequestMethod.POST) public
 * String third_page(ModelMap modelMap,@Valid @ModelAttribute("qual_info")
 * User_Qualification qual_info, BindingResult result, HttpSession
 * session,RedirectAttributes ra) throws IOException
 * 
 * { qualificationValidation.validate(qual_info, result); if
 * (result.hasErrors()) {
 * ra.addFlashAttribute("org.springframework.validation.BindingResult.qual_info"
 * ,result); return "redirect:/qualification_edit";
 * 
 * } qual_info.getMarks_Detail().removeAll(Collections.singleton(null));
 * qual_info.getQualification_Description().removeAll(Collections.singleton(null
 * )); qual_info.getQualification_name().removeAll(Collections.singleton(null));
 * session.removeAttribute("qual_info"); session.setAttribute("qual_info",
 * qual_info); modelMap.addAttribute(GlobalConstant.SKILL, new Skill_info());
 * User_Academic user_academics=new User_Academic(); Master_Qualification_Entity
 * m_academics=new Master_Qualification_Entity();
 * 
 * 
 * User_Academic_Qualification academic=new User_Academic_Qualification();
 * Master_Academic_Qualification master_academics=new
 * Master_Academic_Qualification();
 * 
 * 
 * List<String> ls = qual_info.getQualification_name(); List<String> bs =
 * qual_info.getQualification_Description(); List<String> cs =
 * qual_info.getMarks_Detail();
 * List<Integer>u_academic_qualification_id=qual_info.
 * getUser_academic_qualification_id(); List<Integer>uid=qual_info.getUser_id();
 * List<Integer>aca_qualification_id=qual_info.getAcademic_qualification_id();
 * 
 * int size=ls.size();
 * 
 * for (int i = 0; i < ls.size(); i++) {
 * 
 * if(uid.isEmpty() || uid.get(i)==null) {
 * master_academics.setQualification_name(ls.get(i));
 * academic.setQualification_Description(bs.get(i));
 * academic.setMarks_Detail(cs.get(i));
 * registrationService.qualification_info(academic, master_academics, session);
 * }else { //MASTER m_academics.setQualification_name(ls.get(i));
 * m_academics.setUser_id(uid.get(i));
 * m_academics.setAcademic_qualification_id(aca_qualification_id.get(i)); //USER
 * user_academics.setAcademic_qualification_id(aca_qualification_id.get(i));
 * user_academics.setUser_academic_qualification_id(u_academic_qualification_id.
 * get(i)); user_academics.setQualification_Description(bs.get(i));
 * user_academics.setMarks_Detail(cs.get(i));
 * registrationService.academics_update(user_academics,m_academics); }
 * 
 * }
 * 
 * return "redirect:/skill_back";
 * 
 * }
 * 
 * @RequestMapping(value = "qualdelete/{qualremove}",method =
 * RequestMethod.POST) public void qualdelete(@PathVariable ("qualremove")String
 * qual_id) { System.out.println("called"); if(!qual_id.equals("invalid")) {
 * 
 * registrationService.delete_record(Integer.parseInt(qual_id));
 * 
 * }
 * 
 * 
 * }
 * 
 * 
 * @RequestMapping(value = "skill_back", method = RequestMethod.GET) public
 * String skill(ModelMap modelMap,HttpSession session) {
 * 
 * List list=registrationService.getskill(session);
 * 
 * 
 * Skill_User usk = new Skill_User(); Skill_Master msk=new Skill_Master();
 * 
 * List<Integer>user_skill_id=new ArrayList<Integer>();
 * List<String>experience_in_month=new ArrayList<String>(); List<Integer>uid=new
 * ArrayList<Integer>(); List<Integer>skill_id=new ArrayList<Integer>();
 * List<String>skill_name=new ArrayList<String>();
 * 
 * for(int i=0;i<list.size();i++) { Object []rows = (Object[]) list.get(i);
 * 
 * int u_skill_id= (int) rows[0]; String exp_in_month= (String) rows[1]; String
 * sk_name=(String) rows[2]; int sk_id= (int) rows[3]; int user_id= (int)
 * rows[4];
 * 
 * user_skill_id.add(u_skill_id); experience_in_month.add(exp_in_month);
 * uid.add(user_id); skill_id.add(sk_id); skill_name.add(sk_name);
 * 
 * 
 * 
 * }
 * 
 * //USER usk.setSkill_id(skill_id);
 * usk.setExperience_in_month(experience_in_month);
 * usk.setUser_skill_id(user_skill_id); usk.setUser_id(uid);
 * usk.setSkill_name(skill_name); //MASTER msk.setSkill_id(skill_id);
 * msk.setSkill_name(skill_name); msk.setUser_id(uid);
 * 
 * session.setAttribute("sk", usk);
 * 
 * 
 * 
 * //Qualification_info info=(Qualification_info)
 * session.getAttribute("qual_info"); int size=usk.getSkill_name().size();
 * modelMap.addAttribute("skill_size", size); modelMap.addAttribute("skill", new
 * Skill_User()); dropdown.conn(dBcon.getCon());
 * modelMap.put(GlobalConstant.COUNTRIES, dropdown.getAllCountry()); return
 * "skill_edit"; }
 * 
 * 
 * 
 * @RequestMapping(value = "skill_update", method = RequestMethod.POST) public
 * String fourth_page(
 * 
 * @Valid @ModelAttribute("skill") Skill_User skill, BindingResult result,
 * 
 * @ModelAttribute("cv") Cv cv, HttpSession session,RedirectAttributes ra)
 * throws IOException { Candidate_cv candidate_cv=new Candidate_cv();
 * candidate_cv.setCv_name(cv.getCv_name()); MultipartFile file2 =
 * skill.getFile(); skillValidation.validate(skill, result);
 * customFileValidator.validate(skill, result); if (result.hasErrors()) {
 * 
 * ra.addFlashAttribute("org.springframework.validation.BindingResult.skill",
 * result); return "redirect:/skill_info"; }
 * 
 * if (fileUploadDao.status() == 1) { if (file2 != null) {
 * 
 * UploadFile uploadFile = new UploadFile();
 * uploadFile.setFileName(file2.getOriginalFilename());
 * uploadFile.setData(file2.getBytes());
 * fileUploadDao.saveUploadFile(uploadFile, session);
 * 
 * } } else { byte[] data = file2.getBytes(); String file_name =
 * file2.getOriginalFilename();
 * 
 * FileOutputStream file = new FileOutputStream(filepath + file_name + "");
 * file.write(data);
 * 
 * candidate_cv.setCv_name(file_name);
 * fileUploadDao.updatefileName(candidate_cv, session);
 * 
 * }
 * 
 * 
 * skill.getExperience_in_month().removeAll(Collections.singleton(null));
 * skill.getSkill_name().removeAll(Collections.singleton(null));
 * 
 * session.removeAttribute("skill_info"); session.setAttribute("skill_info",
 * skill); Skill_User_Update skill_user=new Skill_User_Update();
 * Master_Skill_Update skill_master=new Master_Skill_Update();
 * 
 * 
 * Master_skill master_skill=new Master_skill(); User_Skill user_skill=new
 * User_Skill();
 * 
 * 
 * List<String> ls = skill.getSkill_name(); List<String> cs =
 * skill.getExperience_in_month();
 * List<Integer>user_skill_id=skill.getUser_skill_id();
 * List<Integer>uid=skill.getUser_id();
 * List<Integer>skill_id=skill.getSkill_id();
 * 
 * int size=ls.size();
 * 
 * for (int i = 0; i < ls.size(); i++) {
 * 
 * if(uid.isEmpty() || uid.get(i)==null) {
 * master_skill.setSkill_name(ls.get(i));
 * user_skill.setExperience_in_month(cs.get(i));
 * registrationService.skill_info(master_skill, user_skill, session); }else {
 * //MASTER skill_master.setSkill_name(ls.get(i));
 * skill_master.setUser_id(uid.get(i));
 * skill_master.setSkill_id(skill_id.get(i)); //USER
 * skill_user.setSkill_id(skill_id.get(i));
 * skill_user.setUser_skill_id(user_skill_id.get(i));
 * skill_user.setExperience_in_month(cs.get(i));
 * 
 * registrationService.skill_update(skill_master,skill_user); }
 * 
 * } return "action";
 * 
 * }
 * 
 * @RequestMapping(value = "skilldelete/{skillremove}",method =
 * RequestMethod.POST) public void skilldelete(@PathVariable
 * ("skillremove")String skill_id) {
 * 
 * if(!skill_id.equals("invalid")) {
 * 
 * registrationService.delete_skill_record(Integer.parseInt(skill_id));
 * 
 * }
 * 
 * 
 * } }
 */