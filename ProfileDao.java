package com.dao;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.Qualification_info;
import com.model.Skill_info;
import com.model.Uinfo;
import com.model.entity.Current_Address;
import com.model.entity.Permanent_Address;
import com.model.entity.Users;
import com.model.entity.Master_Academic_Qualification;
import com.model.entity.Master_skill;
import com.model.entity.User_Registration;
import com.model.entity.User_Academic_Qualification;
import com.model.entity.User_Skill;
import com.service.ProfileService;

@Repository
@Transactional
public class ProfileDao implements ProfileService {
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Override
	public Qualification_info getProfile(int users_id) {
		Session session = hibernateTemplate.getSessionFactory().openSession();

		String hql = "from Master_Academic_Qualification p inner join p.user_academic_qualification q where p.users_id='"+users_id+"'";
		Master_Academic_Qualification master_qual = null;
		User_Academic_Qualification user_qual = null;
		Query query = session.createQuery(hql);

		List<Object[]> listRes = query.getResultList();
		ArrayList<String> qname = new ArrayList<String>();
		ArrayList<String> qdesc = new ArrayList<String>();
		ArrayList<String> marks = new ArrayList<String>();

		for (Object[] aRow : listRes) {
			master_qual = (Master_Academic_Qualification) aRow[0];
			user_qual = (User_Academic_Qualification) aRow[1];
			qname.add(master_qual.getQualification_name());
			qdesc.add(user_qual.getQualification_Description());
			marks.add(user_qual.getMarks_Detail());
		}
		Qualification_info qinfo = new Qualification_info();
		qinfo.setQualification_name(qname);
		qinfo.setQualification_Description(qdesc);
		qinfo.setMarks_Detail(marks);
		return qinfo;
	}

	@Override
	public Skill_info getSkills(int users_id) {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		String hql = "from Master_skill p inner join p.user_skill q where p.users_id='"+users_id+"'";
		Master_skill master_skill = null;
		User_Skill user_skill = null;
		ArrayList<String> skill_name = new ArrayList<String>();
		ArrayList<String> experience = new ArrayList<String>();
		
		
		Query query = session.createQuery(hql);
		List<Object[]> listResult = query.getResultList();
		for (Object[] aRow : listResult) {
			master_skill = (Master_skill) aRow[0];
			user_skill = (User_Skill) aRow[1];
			skill_name.add(master_skill.getSkill_name());
			experience.add(user_skill.getExperience_in_month());
		}
		
		Skill_info sinfo=new Skill_info();
		sinfo.setSkill_name(skill_name);
		sinfo.setExperience_in_month(experience);
		return sinfo;
	}

	@Override
	public Users uinfo(int users_id) {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Query query=session.createSQLQuery("select * from users where users_id="+users_id+"").setResultTransformer(Transformers.aliasToBean(Uinfo.class));
		List<Uinfo>uinfo=query.list();
		int c_add_id=uinfo.get(0).getCurrent_address();
		int p_add_id=uinfo.get(0).getPermanent_address();
		
	
		Current_Address address=this.hibernateTemplate.get(Current_Address.class,c_add_id);
		Permanent_Address address2=this.hibernateTemplate.get(Permanent_Address.class,p_add_id);
		
		
		
		  Users cp=new Users(); 
		  cp.setCurrent_Address(address);
		  cp.setPermanent_Address(address2); 
		  cp.setUsers_id(users_id);
		  LocalDate date = LocalDate.parse( new SimpleDateFormat("yyyy-MM-dd").format(uinfo.get(0).getDob()) );
		  cp.setDob(date);
		  cp.setGender(uinfo.get(0).getGender()); 
		  cp.setPhone(uinfo.get(0).getPhone());
		  cp.setFirst_name(uinfo.get(0).getFirst_name());
		  cp.setMiddle_name(uinfo.get(0).getMiddle_name());
		  cp.setLast_name(uinfo.get(0).getLast_name());
		
		
		
		
		
		
		return cp;
	}

	

	@Override
	public int user_id(String user_name,HttpSession session) {
		Session s=hibernateTemplate.getSessionFactory().openSession();
		
		
		Query q=s.createSQLQuery("select users_id from user_registration where user_name='"+user_name+"'");
	
		int users_id = (int) q.uniqueResult();
		return users_id;
	}

	@Override
	public void test() {
Session s=hibernateTemplate.getSessionFactory().openSession();
		
		String a="where user_type='USER'";
		Query q=s.createNativeQuery("select * from users "+a+"");
		List list=q.getResultList();
	}

}
