package com.dao;

import java.math.BigInteger;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.User_Login_Info;
import com.model.User_info;
import com.model.entity.Candidate_cv;
import com.model.entity.Current_Address;
import com.model.entity.Employee_Details;
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
import com.service.FileUploadDAO;
import com.service.RegistrationService;

@Transactional
@Repository("form")
public class FormSaveDao implements RegistrationService, FileUploadDAO {
	@Autowired
	HibernateTemplate hibernateTemplate;
	int count = 0;
	HttpSession session2;

	@Override
	public void email_info(User_Registration user) {
		user.setRegistration_status(1);
		this.hibernateTemplate.save(user);
	}
	public int get_usersId(HttpSession session) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		User_Registration use = (User_Registration) session.getAttribute("user");
		String user_name = use.getUser_name();
		Query q = s.createQuery("select users_id from User_Registration where user_name='" + user_name + "'");
		int a = (int) q.uniqueResult();
s.close();
		return a;
	}

	@Transactional
	@Override
	public void user_info(Users profile, HttpSession session) {

		Session s = hibernateTemplate.getSessionFactory().openSession();
		int a=get_usersId(session);
		User_info profile2 = (User_info) session.getAttribute("profile");
		profile.setUsers_id(a);
		this.hibernateTemplate.save(profile);
		s.getTransaction().begin();

		Query st = s.createSQLQuery("update user_registration set registration_status=2 where users_id=" + a + "");
		st.executeUpdate();
		s.getTransaction().commit();
	}

	@Override
	public void equaladdress(Current_Address address, HttpSession session) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		int a=get_usersId(session);

		s.getTransaction().begin();
		Query u2 = s.createQuery(
				"update com.model.entity.Users set permanent_address=current_address where users_id="
						+ a + "");
		u2.executeUpdate();
		s.getTransaction().commit();

	}

	@Override
	public void skill_info(Master_skill master_skill, User_Skill user_skill, HttpSession session) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		int a=get_usersId(session);

		master_skill.setUser_id(a);
		user_skill.setMaster_skill(master_skill);
		master_skill.setUser_skill(user_skill);

		this.hibernateTemplate.merge(user_skill);
		s.getTransaction().begin();

		Query st = s.createSQLQuery("update user_registration set registration_status=4 where users_id=" + a + "");
		st.executeUpdate();
		s.getTransaction().commit();
	}

	
	@Override
	public void saveFile(UploadFile uploadFile, HttpSession session) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		int a=get_usersId(session);
		uploadFile.setUser_id(a);
		this.hibernateTemplate.save(uploadFile);

	}
	@Override
	public void saveUploadFile(UploadFile uploadFile, HttpSession session) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		int a=get_usersId(session);
		Query query=s.createSQLQuery("select upload_id from uploadfile where users_id="+a+"");
		if(query.getResultList().isEmpty())
		{
			saveFile(uploadFile, session);
		}else {
		int upload_id=(int) query.getSingleResult();
		uploadFile.setUser_id(a);
		uploadFile.setUpload_id(upload_id);
		this.hibernateTemplate.saveOrUpdate(uploadFile);
		}
	}
	

	@Override
	public void saveName(Candidate_cv candidate_cv, HttpSession session) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		int a=get_usersId(session);
		candidate_cv.setUser_id(a);
		this.hibernateTemplate.save(candidate_cv);

	}
	
	@Override
	public void updatefileName(Candidate_cv candidate_cv, HttpSession session) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		int a=get_usersId(session);
		Query query=s.createSQLQuery("select candidate_cv_id from candidate_cv where users_id="+a+"");
		if(query.getResultList().isEmpty())
		{
			saveName(candidate_cv, session);
		}else
		{
		int candidate_cv_id=(int) query.getSingleResult();
		candidate_cv.setUser_id(a);
		candidate_cv.setCandidate_cv_id(candidate_cv_id);
		this.hibernateTemplate.saveOrUpdate(candidate_cv);
		}
	}
	@Override
	public int status() {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		NativeQuery q = s.createSQLQuery("select file_upload_by_name from configuration");
		int result = (int) q.uniqueResult();
		return result;
	}

	@Override
	public int email_check(String user_name) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		NativeQuery q = s.createSQLQuery("select distinct u.user_name from user_registration u,employee_registration r  where (u.user_name='" + user_name + "' or r.user_name='" + user_name + "')");
		List ls = q.getResultList();
		if (ls.size() != 0)
			return 1;
		else {
			return 0;
		}
	}

	@Override
	public void qualification_info(User_Academic_Qualification user_academics,
			Master_Academic_Qualification master_academics, HttpSession session) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		int a=get_usersId(session);
		master_academics.setUser_id(a);
		user_academics.setMaster_academic_qualification(master_academics);
		master_academics.setUser_academic_qualification(user_academics);
		this.hibernateTemplate.merge(user_academics);
		s.getTransaction().begin();

		Query st = s.createSQLQuery("update user_registration set registration_status=3 where users_id=" + a + "");
		st.executeUpdate();
		s.getTransaction().commit();
	}

	@Override
	public void email_update(User_Registration user, HttpSession session) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		int a=get_usersId(session);
		user.setUsers_id(a);
		this.hibernateTemplate.update(user);

	}

	@Override
	public void user_update(Current_Address add, Permanent_Address add2, Users cp, HttpSession session) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		int a=get_usersId(session);
		cp.setUsers_id(a);
		Query q2 = s.createNativeQuery(
				"select current_address,permanent_address from users where users_id="
						+ a + "");
		List<Object[]> ls = q2.getResultList();
if(ls.isEmpty())
{
user_info(cp, session);
}else
{
		Object[] result = ls.get(0);
		int address_id1 = Integer.parseInt(result[0].toString());
		int address_id2 = Integer.parseInt(result[1].toString());
		add.setAddress_id(address_id1);
		if (address_id1 == address_id2 && add.getAddress_type().equals("pc")
				|| address_id1 != address_id2 && add.getAddress_type().equals("c"))
			add2.setAddress_id(address_id2);
		if (address_id1 != address_id2 && add.getAddress_type().equals("pc"))
			this.hibernateTemplate.delete(hibernateTemplate.get(Permanent_Address.class, address_id2));

		this.hibernateTemplate.saveOrUpdate(cp);

}
	}

	public List getqual(HttpSession session) {

		Session s = hibernateTemplate.getSessionFactory().openSession();
		int a=get_usersId(session);
		Query query = s.createNativeQuery(
				"select  user_academic_qualification.user_academic_qualification_id, user_academic_qualification.Marks_Detail, user_academic_qualification.Qualification_Description, user_academic_qualification.academic_qualification_id,master_academic_qualification.qualification_name,master_academic_qualification.users_id from user_academic_qualification,master_academic_qualification where master_academic_qualification.users_id="
						+ a
						+ " AND user_academic_qualification.academic_qualification_id = master_academic_qualification.academic_qualification_id");

		List list = query.list();

		return list;
	}

	@Override
	public void qualification_update(User_Academic_Qualification user_academics,
			Master_Academic_Qualification master_academics, HttpSession session) {

		Session s = hibernateTemplate.getSessionFactory().openSession();
		int a=get_usersId(session);
		user_academics.setMaster_academic_qualification(master_academics);
		master_academics.setUser_academic_qualification(user_academics);

		this.hibernateTemplate.saveOrUpdate(master_academics);
		this.hibernateTemplate.saveOrUpdate(user_academics);

	}

	@Override
	public void academics_update(User_Academic user_academics, Master_Qualification_Entity m_academics) {
		this.hibernateTemplate.saveOrUpdate(m_academics);
		this.hibernateTemplate.saveOrUpdate(user_academics);

	}

	@Override
	public void delete_record(int qual_id) {

		Session s = hibernateTemplate.getSessionFactory().openSession();
		s.beginTransaction();
		Query query2 = s.createSQLQuery(
				"delete from master_academic_qualification where academic_qualification_id=" + qual_id + "");
		query2.executeUpdate();
		s.getTransaction().commit();
	}

	public Current_Address address(int id) {

		Current_Address address = this.hibernateTemplate.get(Current_Address.class, id);
		return address;
	}

	@Override
	public void save_address(Current_Address address, HttpSession session) {
		
		this.hibernateTemplate.saveOrUpdate(address);
	}

	@Override
	public List getskill(HttpSession session) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		int a=get_usersId(session);
		Query query = s.createNativeQuery(
				"select user_skill.user_skill_id, user_skill.experience_in_month,master_skill.skill_name,master_skill.skill_id,master_skill.users_id from user_skill,master_skill where master_skill.users_id="
						+ a + " AND user_skill.skill_id = master_skill.skill_id");

		List list = query.list();

		return list;
	}

	@Override
	public void skill_update(Master_Skill_Update skill_master, Skill_User_Update skill_user) {

		this.hibernateTemplate.saveOrUpdate(skill_master);
		this.hibernateTemplate.saveOrUpdate(skill_user);
	}


	@Override
	public void delete_skill_record(int skill_id) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		s.beginTransaction();
		Query query2 = s.createSQLQuery("delete from master_skill where skill_id=" + skill_id + "");
		query2.executeUpdate();
		s.getTransaction().commit();

	}
	@Override
	public void test() {
		Employee_Details emp=new Employee_Details();
		emp.setUsers_id(121);
		hibernateTemplate.save(emp);
	}
	@Override
	public User_Login_Info getUser_Login_Info(String email) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		Query query=s.createSQLQuery("select employee_registration.users_id,employee_registration.user_type,users.first_name,users.last_name from employee_registration,users where employee_registration.user_name='"+email+"' and users.users_id=employee_registration.users_id").setResultTransformer(Transformers.aliasToBean(User_Login_Info.class));
		User_Login_Info info= (User_Login_Info) query.uniqueResult();
		if(info!=null)
		{
			return info;
		}else
		{
		Query query2=s.createSQLQuery("select user_registration.users_id,user_registration.user_type,users.first_name,users.last_name from user_registration,users where user_registration.user_name='"+email+"' and users.users_id=user_registration.users_id").setResultTransformer(Transformers.aliasToBean(User_Login_Info.class));
		User_Login_Info info2= (User_Login_Info) query2.uniqueResult();
		return info2;
		}
	}
	@Override
	public void removeReferer(String previousUrl) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		s.getTransaction().begin();
		Query q=s.createQuery("delete from AccessUrls where url='"+previousUrl+"'");
		q.executeUpdate();
		s.getTransaction().commit();
	}
}
