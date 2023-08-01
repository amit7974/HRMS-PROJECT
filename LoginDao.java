package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.model.Employee_Info;
import com.model.entity.Current_Address;
import com.model.entity.Permanent_Address;
import com.model.entity.User_Registration;
import com.service.LoginService;

@Repository
public class LoginDao implements LoginService {
	@Autowired
	HibernateTemplate hibernateTemplate;

	@Override
	public List<User_Registration> getEmailPassword(String email) {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Query<User_Registration> q = session.createNativeQuery(
				"select * from user_registration where user_name='" + email + "'", User_Registration.class);
		List<User_Registration> ls = q.getResultList();

		return ls;

	}

	@Override
	public String check_status(String email) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		NativeQuery q = s.createSQLQuery("select status from employee_registration where user_name='" + email + "'");
		if(q.getResultList().isEmpty())
		{
			return "other";
		}
		String a = (String) q.uniqueResult();

		return a;
	}

	@Override
	public Employee_Info employee_details_by_email(String email) {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query query=s.createNativeQuery("select e.user_name,e.profile_pic,u.first_name,u.last_name,u.phone,u.gender,u.dob,u.current_address,u.permanent_address from employee_registration e,users u where e.users_id=u.users_id and e.user_name='"+email+"'").setResultTransformer(Transformers.aliasToBean(Employee_Info.class));
		List<Employee_Info> list= query.getResultList();
		Employee_Info employee_profile=list.get(0);
		int c_add_id=employee_profile.getCurrent_address();
		int p_add_id=employee_profile.getPermanent_address();
		
	
		Current_Address address=this.hibernateTemplate.get(Current_Address.class,c_add_id);
		Permanent_Address address2=this.hibernateTemplate.get(Permanent_Address.class,p_add_id);
		employee_profile.setAddress_line_1(address.getAddress_line_1());
		employee_profile.setAddress_line_2(address.getAddress_line_2());
		employee_profile.setCity_name(address.getCity_name());
		employee_profile.setState_name(address.getState_name());
		employee_profile.setCountry_name(address.getCountry_name());
		employee_profile.setLandmark(address.getLandmark());
		employee_profile.setPin_code(address.getPin_code());
		
		employee_profile.setAddress_line_1p(address2.getAddressp());
		employee_profile.setAddress_line_2p(address2.getAddress2p());
		employee_profile.setCity_namep(address2.getCity_namep());
		employee_profile.setState_namep(address2.getState_namep());
		employee_profile.setCountry_namep(address2.getCountry_namep());
		employee_profile.setLandmarkp(address2.getLandmarkp());
		employee_profile.setPin_codep(address2.getPin_codep());
		
		return employee_profile;
		
	}
}
