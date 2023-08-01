package com.dao;

import java.math.BigInteger;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.Employee_Info;
import com.model.Employees;
import com.model.Filter_Result;
import com.model.Filter_User;
import com.model.entity.Company_Office_Details;
import com.model.entity.Current_Address;
import com.model.entity.Employee_Details;
import com.model.entity.Geographic_Calendar;
import com.model.entity.Holiday_Calendar;
import com.model.entity.Holiday_Calendar_Description;
import com.model.entity.Permanent_Address;
import com.model.entity.UploadFile;
import com.service.AdminService;
@Repository
@Transactional
public class AdminDao implements AdminService {
@Autowired
HibernateTemplate hibernateTemplate;
@Autowired
HttpSession session;
	@Override
	public List getAllUser(Filter_User filter) {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		String qual_name="";
		if(filter.getQual_name()!="")
			qual_name="and master_academic_qualification.qualification_name='"+filter.getQual_name()+"'";
		String skill_name="";
		if(filter.getSkill_name()!="")
			skill_name="and master_skill.skill_name='"+filter.getSkill_name()+"'";
		Query q=s.createNativeQuery("select user_registration.user_name,users.first_name,users.middle_name,users.last_name,user_registration.users_id,master_skill.skill_name,user_skill.*,user_academic_qualification.*,master_academic_qualification.qualification_name from user_registration,users, master_skill,user_skill,user_academic_qualification,master_academic_qualification where user_registration.users_id=master_skill.users_id and user_registration.users_id=users.users_id and master_academic_qualification.academic_qualification_id=user_academic_qualification.academic_qualification_id and master_skill.skill_id=user_skill.skill_id and master_academic_qualification.users_id=master_skill.users_id and user_skill.experience_in_month between "+filter.min_exp+" and "+filter.max_exp+" and user_academic_qualification.Marks_Detail between "+filter.min_marks+" and "+filter.max_marks+" "+qual_name+" "+skill_name+" group by master_skill.users_id").setResultTransformer(Transformers.aliasToBean(Filter_Result.class));
		List<Filter_Result> list=q.getResultList();
		return list;
	}

	@Override
	public List<String> getAllQual() {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query query=s.createNativeQuery("select distinct master_academic_qualification.qualification_name from master_academic_qualification,master_skill where master_skill.users_id=master_academic_qualification.users_id;");
		List<String>ls=query.getResultList();
		Query qu=s.createNativeQuery("select distinct master_skill.users_id from master_skill");
		int count=qu.getResultList().size();
		session.setAttribute("count",count);
		
		return ls;
	}

	@Override
	public List<String> getAllSkill() {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query query=s.createNativeQuery("select distinct skill_name from master_skill");
		List<String>ls=query.getResultList();
		return ls;
	}

	@Override
	public List<Filter_Result> getFiltered_User(String qual, String skill,String min_qual,String min_skill,String max_qual,String max_skill,int page) {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		String query="select user_registration.user_name,users.first_name,users.middle_name,users.last_name,user_registration.users_id,master_skill.skill_name,user_skill.*,user_academic_qualification.*,master_academic_qualification.qualification_name from user_registration,users, master_skill,user_skill,user_academic_qualification,master_academic_qualification where user_registration.users_id=master_skill.users_id and user_registration.users_id=users.users_id and master_academic_qualification.academic_qualification_id=user_academic_qualification.academic_qualification_id and master_skill.skill_id=user_skill.skill_id and master_academic_qualification.users_id=master_skill.users_id";
		if(!qual.equals("invalid"))
		query=query+" "+"and master_academic_qualification.qualification_name IN ("+qual+")";
		if(!skill.equals("invalid"))				  		
		query=query+" "+"and master_skill.skill_name IN ("+skill+")";
		
		Query q=s.createNativeQuery(query+" "+"and user_academic_qualification.Marks_Detail between "+min_qual+" and "+max_qual+" and user_skill.experience_in_month between "+min_skill+" and "+max_skill+" "+"group by user_registration.users_id order by user_registration.users_id").setResultTransformer(Transformers.aliasToBean(Filter_Result.class));
		int total_items=q.getResultList().size();
		final int LIMITITEMSPERPAGE = 8;
		q.setMaxResults(LIMITITEMSPERPAGE);
	    q.setFirstResult(page * LIMITITEMSPERPAGE);
		List<Filter_Result> list=q.getResultList();
		int total_pages=(int) (Math.ceil(total_items+LIMITITEMSPERPAGE-1)/LIMITITEMSPERPAGE);
		session.setAttribute("total_pages", total_pages);
		return list;
	}

	@Override
	public UploadFile getFile(Integer fileId) {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query q=s.createQuery("select upload_id from UploadFile where users_id="+fileId+"");
		int id=(int) q.uniqueResult();
		UploadFile uf=this.hibernateTemplate.get(UploadFile.class, id);
		
		//UploadFile uf=(UploadFile) q.getResultList();
		return uf;
	}

	@Override
	public List<String> getQualById(Integer user_id) {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query q=s.createSQLQuery("select qualification_name from master_academic_qualification where users_id="+user_id+"");
		List<String>ls=q.getResultList();
		return ls;
	}
	@Override
	public List<String> getSkillById(Integer user_id) {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query q=s.createSQLQuery("select skill_name from master_skill where users_id="+user_id+"");
		List<String>ls=q.getResultList();
		return ls;
	}

	@Override
	public List<UploadFile> getAllFile() {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		
		List<UploadFile> ls=this.hibernateTemplate.loadAll(UploadFile.class);
		return ls;
	}

	@Override
	public void listBy(int page) {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		final int LIMITITEMSPERPAGE = 1;
		Query query=s.createNativeQuery("select distinct skill_name from master_skill");
		int sa=query.getResultList().size();
		query.setMaxResults(LIMITITEMSPERPAGE);
	    query.setFirstResult(page * LIMITITEMSPERPAGE);
	    
		List<String>ls=query.getResultList();
		System.out.println(ls+" "+sa);
	}

	@Override
	public List<Employees> get_employees() {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query query=s.createNativeQuery("select e.user_name,u.first_name,u.last_name,e.status,e.users_id from users u,employee_registration e where e.user_type='EMPLOYEE' and u.users_id=e.users_id").setResultTransformer(Transformers.aliasToBean(Employees.class));
	 	List<Employees> emp_list=query.getResultList();
		return emp_list;
	}

	@Override
	public void reject_employee(int id) {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		s.getTransaction().begin();
		Query q=s.createSQLQuery("update employee_registration set status='rejected' where users_id="+id+"");
		q.executeUpdate();
		s.getTransaction().commit();
	}

	@Override
	public void approve_employee(int id,String employee_code,int office_id) {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		s.getTransaction().begin();
		Query q=s.createSQLQuery("update employee_registration set status='approved' where users_id="+id+"");
		q.executeUpdate();
		s.getTransaction().commit();
		try {
		Query query=s.createSQLQuery("select max(serial_no) from employee_details");
		int num=(int)query.uniqueResult();
		s.getTransaction().begin();
		Query query2=s.createSQLQuery("ALTER TABLE employee_details AUTO_INCREMENT="+num+"");
		query2.executeUpdate();
		s.getTransaction().commit();
		}catch (Exception e) {
			System.out.println("serial no not found");
		}
		Employee_Details details=new Employee_Details();
		details.setUsers_id(id);
		details.setOffice_id(office_id);
		details.setReporting_manager(employee_code);
		hibernateTemplate.save(details);
		
	}
	
	@Override
	public Employee_Info employee_details_by_id(int user_id) {
		
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query query=s.createNativeQuery("select e.user_name,e.profile_pic,u.first_name,u.last_name,u.phone,u.gender,u.dob,u.current_address,u.permanent_address from employee_registration e,users u where e.users_id=u.users_id and e.users_id="+user_id+"").setResultTransformer(Transformers.aliasToBean(Employee_Info.class));
		List<Employee_Info> list= query.getResultList();
		Employee_Info emp_list=list.get(0);
		int c_add_id=emp_list.getCurrent_address();
		int p_add_id=emp_list.getPermanent_address();
		
	
		Current_Address address=this.hibernateTemplate.get(Current_Address.class,c_add_id);
		Permanent_Address address2=this.hibernateTemplate.get(Permanent_Address.class,p_add_id);
		emp_list.setAddress_line_1(address.getAddress_line_1());
		emp_list.setAddress_line_2(address.getAddress_line_2());
		emp_list.setCity_name(address.getCity_name());
		emp_list.setState_name(address.getState_name());
		emp_list.setCountry_name(address.getCountry_name());
		emp_list.setLandmark(address.getLandmark());
		emp_list.setPin_code(address.getPin_code());
		
		emp_list.setAddress_line_1p(address2.getAddressp());
		emp_list.setAddress_line_2p(address2.getAddress2p());
		emp_list.setCity_namep(address2.getCity_namep());
		emp_list.setState_namep(address2.getState_namep());
		emp_list.setCountry_namep(address2.getCountry_namep());
		emp_list.setLandmarkp(address2.getLandmarkp());
		emp_list.setPin_codep(address2.getPin_codep());
		
		return emp_list;
		
		

		
	}

	@Override
	public List<Employees> employee_by_status(String status) {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query query=s.createNativeQuery("select e.user_name,u.first_name,u.last_name,e.status,e.users_id from users u,employee_registration e where e.user_type='EMPLOYEE' and u.users_id=e.users_id and e.status='"+status+"'").setResultTransformer(Transformers.aliasToBean(Employees.class));
		List<Employees> emp_list=query.getResultList();
		
		return emp_list;
	}

	@Override
	public List<Employees> employee_search(String search_emp) {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query query=s.createNativeQuery("select distinct ed.employee_code,er.user_name,u.first_name,u.last_name from employee_details ed inner join employee_registration er on er.users_id=ed.users_id inner join users u on ed.users_id=u.users_id and (ed.employee_code='"+search_emp+"' or er.user_name='"+search_emp+"' or u.first_name='"+search_emp+"' or u.last_name='"+search_emp+"')").setResultTransformer(Transformers.aliasToBean(Employees.class));
		List<Employees> emp_list=query.getResultList();
		return emp_list;
	}

	@Override
	public List<String> getOfficeState(String country) {
		
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query q=s.createSQLQuery("select state from company_office_details where country='"+country+"'");
		List<String> state= q.getResultList();
		return state;
	}
	
	@Override
	public List<String> getOfficeCity(String state) {
		
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query q=s.createSQLQuery("select city from company_office_details where state='"+state+"'");
		List<String> city= q.getResultList();
		return city;
	}
	@Override
	public List<String> getOfficeCountry() {
		
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query q=s.createSQLQuery("select distinct country from company_office_details");
		List<String> country= q.getResultList();
		return country;
	}
	@Override
	public void save_holiday_calendar(Holiday_Calendar_Description holiday_cal_desc) {
		
		this.hibernateTemplate.save(holiday_cal_desc);
		
	}
	@Override
	public void save_geographic_calendar(Geographic_Calendar geographic_calendar) {
		hibernateTemplate.save(geographic_calendar);
		
	}

	@Override
	public List<Holiday_Calendar> getHolidayCalendarAll() {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query q=s.createSQLQuery("select * from holiday_calendar order by calendar_year").setResultTransformer(Transformers.aliasToBean(Holiday_Calendar.class));
		List<Holiday_Calendar> cal= q.getResultList();
		return cal;
	}
	
	@Override
	public List<Holiday_Calendar> getHolidayCalendarYear(int year) {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query q=s.createSQLQuery("select * from holiday_calendar where calendar_year="+year+" ").setResultTransformer(Transformers.aliasToBean(Holiday_Calendar.class));;
		List<Holiday_Calendar> cal= q.getResultList();
		return cal;
	}

	@Override
	public List<Integer> getCal_Year() {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query q=s.createSQLQuery("select distinct calendar_year from holiday_calendar");
		List<Integer> years=q.getResultList();
		return years;
	}

	@Override
	public int getCheck_Data_Existance(String city, String state, String country, int year) {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query q=s.createSQLQuery("SELECT EXISTS(SELECT * FROM holiday_calendar WHERE calendar_year="+year+" and city='"+city+"' and state='"+state+"' and country='"+country+"')");
		Integer status=((BigInteger)q.uniqueResult()).intValue();
		return status;
	}

	@Override
	public int add_region(String city, String state, String country, int year) {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		s.getTransaction().begin();
		Query q=s.createSQLQuery("INSERT INTO holiday_calendar (calendar_year,city,state,country)SELECT * FROM (SELECT "+year+", '"+city+"', '"+state+"','"+country+"') AS tmp WHERE NOT EXISTS ( SELECT calendar_year,city,state,country FROM holiday_calendar WHERE calendar_year = "+year+" and city='"+city+"' and state='"+state+"' and country='"+country+"') LIMIT 1");
		int status=q.executeUpdate();
		s.getTransaction().commit();
		return status;
	}

	@Override
	public List<Geographic_Calendar> getGeographic_Cal() {
		List<Geographic_Calendar> cal=hibernateTemplate.loadAll(Geographic_Calendar.class);
		return cal;
	}

	@Override
	public void saveOffice(Company_Office_Details office_details) {
		hibernateTemplate.save(office_details);
		
	}
	@Override
	@Transactional
	public void updateOffice(Company_Office_Details office_details) {
		hibernateTemplate.update(office_details);
		
	}
	@Override
	public List<Company_Office_Details> getAllOffice() {
		List<Company_Office_Details> office=hibernateTemplate.loadAll(Company_Office_Details.class);
		return office;
	}
	
	@Override
	public Company_Office_Details getOfficeById(int id) {
		Company_Office_Details office=hibernateTemplate.get(Company_Office_Details.class, id);
		return office;
	}

	@Override
	public Geographic_Calendar geographic_calendar_by_id(int user_id) {
		Geographic_Calendar cal=hibernateTemplate.get(Geographic_Calendar.class, user_id);
		return cal;
	}

	@Override
	public List<String> getManagers() {
		Session s=this.hibernateTemplate.getSessionFactory().openSession();
		Query q=s.createSQLQuery("select users.first_name,users.last_name from users,employee_registration where users.users_id=employee_registration.users_id and employee_registration.status='approved'");
		List<String> managers=q.list();
		return managers;
	}
	
	
	
}
