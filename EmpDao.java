 package com.dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.Approval;
import com.model.Employees.Job_Vacancy;
import com.model.Leave_List;
import com.model.User_info;
import com.model.entity.Current_Address;
import com.model.entity.Employee_Registration;
import com.model.entity.Leave_Application;
import com.model.entity.Users;
import com.service.EmpService;
@Repository
@Transactional
public class EmpDao implements EmpService {
	@Autowired
	HibernateTemplate hibernateTemplate;
	@Override
	public void emp_details(Users emp_info,User_info info, HttpSession session) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		Employee_Registration ei= (Employee_Registration) session.getAttribute("employee_Registration");
		String email=ei.getUser_name();
		Query q = s.createQuery("select users_id from Employee_Registration where user_name='" + email + "'");
		int userId = (int) q.uniqueResult();
		emp_info.setUsers_id(userId);
		this.hibernateTemplate.save(emp_info);
		
		Employee_Registration er=new Employee_Registration();
		try {
			er.setProfile_pic(info.getFile().getBytes());
			s.getTransaction().begin();
			
			Query st = s.createSQLQuery("update employee_registration set profile_pic=? where users_id=" + userId + "");
			st.setParameter(1,er.getProfile_pic());
			st.executeUpdate();
			
			
			s.getTransaction().commit();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void equaladdress(Current_Address emp_address, HttpSession session) {
	
		Session s = hibernateTemplate.getSessionFactory().openSession();
		Employee_Registration ei= (Employee_Registration) session.getAttribute("employee_Registration");
		String email=ei.getUser_name();
		Query q = s.createQuery("select users_id from Employee_Registration where user_name='" + email + "'");
		int userId = (int) q.uniqueResult();
		
	
		

		s.getTransaction().begin();
		Query q2 = s.createQuery("update com.model.entity.Users set permanent_address=current_address where users_id='" + userId+ "'");
		q2.executeUpdate();
		s.getTransaction().commit();
	}

	@Override
	public void save_emp_register(Employee_Registration employee_Registration) {
		hibernateTemplate.save(employee_Registration);
		
	}

	@Override
	public String getEmployee_code(String email) {
		

		Session s = hibernateTemplate.getSessionFactory().openSession();
		Query q = s.createSQLQuery("select ed.employee_code from employee_details ed,employee_registration er where ed.users_id=er.users_id and er.user_name='" + email + "'");
		try {
		String employee_code =  (String) q.uniqueResult();
		return employee_code;
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return "";
		}
		
	}

	@Override
	public Approval getReporting_manager(String email) {
		Session s = hibernateTemplate.getSessionFactory().openSession();
		Query q = s.createSQLQuery("select ed.reporting_manager from employee_details ed,employee_registration er where ed.users_id=er.users_id and er.user_name='" + email + "'");
		try {
		String reporting_manager =  (String) q.uniqueResult();
		Query q2=s.createSQLQuery("select users.first_name,users.last_name,employee_registration.user_name from employee_details,employee_registration,users where employee_details.employee_code='"+reporting_manager+"' and employee_details.users_id=employee_registration.users_id and employee_details.users_id=users.users_id").setResultTransformer(Transformers.aliasToBean(Approval.class));
		Approval approval=(Approval) q2.uniqueResult();
		approval.setEmployee_code(reporting_manager);
		return approval;
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
		@Override
		public List<Approval> getApproval2()
		{
			Session s = hibernateTemplate.getSessionFactory().openSession();
			Query q2=s.createSQLQuery("select employee_details.employee_code ,users.first_name,users.last_name,employee_registration.user_name from employee_details,employee_registration,users where employee_details.users_id=employee_registration.users_id and employee_details.users_id=users.users_id").setResultTransformer(Transformers.aliasToBean(Approval.class));
			List<Approval> approval=q2.getResultList();
			return approval;
			
		
	}

		@Override
		public void save_Leave_Application(Leave_Application leave_application) {
			hibernateTemplate.save(leave_application);
			
		}


		@Override
		public void approve_leave(int leave_id, String approved_by, LocalDate localDate) {
			Session s = hibernateTemplate.getSessionFactory().openSession();
			s.getTransaction().begin();
			s.createSQLQuery("update leave_application set status='approved',approved_by='"+approved_by+"',approved_date='"+localDate+"' where leave_application_id="+leave_id+"").executeUpdate();
			
			s.getTransaction().commit();
			
		}
	
		@Override
		public void reject_leave(int leave_id, String approved_by, LocalDate localDate) {
			Session s = hibernateTemplate.getSessionFactory().openSession();
			s.getTransaction().begin();
			s.createSQLQuery("update leave_application set status='rejected',approved_by='"+approved_by+"',approved_date='"+localDate+"' where leave_application_id="+leave_id+"").executeUpdate();
			
			s.getTransaction().commit();
			
		}

		@Override
		public List<Leave_List> employee_by_status(String emp_code,String status) {
			Session s = hibernateTemplate.getSessionFactory().openSession();
			Query q2=s.createSQLQuery("select leave_application.leave_application_id,leave_application.from_date,leave_application.to_date,leave_application.status,leave_application.applied_by,leave_application.applied_date,leave_application.leave_type,users.first_name,users.last_name,employee_registration.user_name from leave_application,users,employee_registration,employee_details where (leave_application.approver2='"+emp_code+"' or leave_application.approver1='"+emp_code+"') and leave_application.status='"+status+"' and employee_details.employee_code=leave_application.applied_by and users.users_id=employee_details.users_id and employee_registration.users_id=employee_details.users_id").setResultTransformer(Transformers.aliasToBean(Leave_List.class));
			List<Leave_List> leave_list=q2.getResultList();
			return leave_list;
		}

		@Override
		public List<Leave_List> leave_details_by_id(int leave_id) {
			Session s = hibernateTemplate.getSessionFactory().openSession();
			Query q2=s.createSQLQuery("select from_date, to_date,status, no_of_days, applied_date, leave_type, applied_by,approver1, approver2,approved_date,approved_by from leave_application where leave_application_id="+leave_id+"").setResultTransformer(Transformers.aliasToBean(Leave_List.class));
			List<Leave_List> leave_list=q2.getResultList();
			return leave_list;
			
		}

		@Override
		public List<Integer> getApplied_year_by_emp_code(String emp_code) {
			Session s = hibernateTemplate.getSessionFactory().openSession();
			Query q2=s.createSQLQuery("select distinct year(from_date) from leave_application where applied_by='"+emp_code+"' order by from_date");
			List<Integer> years=q2.getResultList();
			return years;
		}

		@Override
		public List<Leave_List> leave_by_year(int year,String emp_code) {
			Session s = hibernateTemplate.getSessionFactory().openSession();
			Query q2=s.createSQLQuery("select tb1.leave_application_id,from_date, to_date,status, applied_date, leave_type,approver2,approved_by from( select distinct leave_application_id,from_date, to_date,status, applied_date, leave_type,concat(users.first_name,' ',users.last_name) as approver2 from leave_application,users,employee_details where leave_application.applied_by='"+emp_code+"' and year(from_date)="+year+" and employee_details.employee_code in (select distinct approver2 from leave_application where applied_by='"+emp_code+"') and employee_details.users_id=users.users_id and employee_details.employee_code=leave_application.approver2) as tb1 left join (select distinct leave_application_id,concat(users.first_name,' ',users.last_name) as approved_by from leave_application,users,employee_details where leave_application.applied_by='"+emp_code+"' and year(from_date)="+year+" and employee_details.employee_code in (select distinct approved_by from leave_application where applied_by='"+emp_code+"') and employee_details.users_id=users.users_id and employee_details.employee_code=leave_application.approved_by) as tb2 on tb1.leave_application_id=tb2.leave_application_id").setResultTransformer(Transformers.aliasToBean(Leave_List.class));
			List<Leave_List> leave_list=q2.getResultList();
			return leave_list;
		}

		@Override
		public String getapprover1(String emp_code) {
			Session s = hibernateTemplate.getSessionFactory().openSession();
			Query q = s.createSQLQuery("select concat(users.first_name,' ',users.last_name) as approver1 from users,employee_details where employee_details.employee_code='"+emp_code+"' and users.users_id=employee_details.users_id");
			try {
			String approver1 =  (String) q.uniqueResult();
			return approver1;
			}catch (Exception e) {
				System.out.println(e.getMessage());
				return "";
			}
		}
		
		@Override
		public void cancel_leave(int leave_id) {
			Session s = hibernateTemplate.getSessionFactory().openSession();
			s.getTransaction().begin();
			s.createSQLQuery("update leave_application set status='cancelled' where leave_application_id="+leave_id+"").executeUpdate();
			
			s.getTransaction().commit();
			
		}
		
		@Override
		public int remaining_leave(String emp_code, String leave_type) {
			Session s = hibernateTemplate.getSessionFactory().openSession();
			int result=0;
			Query query=s.createSQLQuery("select geographic_calendar."+leave_type+"_leaves_applicable-sum(leave_application.no_of_days) from geographic_calendar,leave_application,employee_details,company_office_details where (employee_details.office_id=company_office_details.office_id and employee_details.employee_code='"+emp_code+"' and company_office_details.geographic_calendar_id=geographic_calendar.geographic_calendar_id and leave_application.applied_by='"+emp_code+"' and leave_application.leave_type='"+leave_type+"' and leave_application.status in('approved','pending'))");
			try {
			result=Integer.parseInt(query.uniqueResult().toString());
			}catch (NullPointerException e) {
				result=1;
				return result;
			}
			return result;
		}
		
		
		@Override
		public int leave_validation(String emp_code, String leave_type,int days) {
			Session s = hibernateTemplate.getSessionFactory().openSession();
			int result=0;
			Query query=s.createSQLQuery("select ifnull((select geographic_calendar."+leave_type+"_leaves_applicable-sum(leave_application.no_of_days) from geographic_calendar,leave_application,employee_details,company_office_details where (employee_details.office_id=company_office_details.office_id and employee_details.employee_code='"+emp_code+"' and company_office_details.geographic_calendar_id=geographic_calendar.geographic_calendar_id and leave_application.applied_by='"+emp_code+"' and leave_application.leave_type='"+leave_type+"' and leave_application.status in('approved','pending'))),(select distinct geographic_calendar."+leave_type+"_leaves_applicable from geographic_calendar,leave_application,employee_details,company_office_details where (employee_details.office_id=company_office_details.office_id and employee_details.employee_code='"+emp_code+"' and company_office_details.geographic_calendar_id=geographic_calendar.geographic_calendar_id and leave_application.applied_by='"+emp_code+"')))");
			
			try {
			result=Integer.parseInt(query.uniqueResult().toString());
			}catch (NullPointerException e) {
				result=1;
				return result;
			}
			return result;
		}
		
		
		// my c0des
		
		
	//	public List<Job_Vacancy> Job_VacancyDao(int job_vacancy_id) {
	//		Session s = hibernateTemplate.getSessionFactory().openSession();
	//		Query q2=s.createSQLQuery("select * From job_vacancy ");
	//		List<Job_Vacancy> job_vacancy=q2.getResultList();
	//		return job_vacancy;
		
		
		
	public class Job_VacancyDao{
		@Autowired
		
		private HibernateTemplate hibernateTemplate;
		
		//create
		@Transactional
		
		public void createJob_Vacancy(Job_Vacancy  job_vacancy) {
			this.hibernateTemplate.save(job_vacancy);
		}
		// get all job_vacancy
public List<Job_Vacancy> getJob_Vacancies(){
	List<Job_Vacancy> job_vacancies = this.hibernateTemplate.loadAll(Job_Vacancy.class);
		return job_vacancies;
	}


// delete the job_vacncy
@Transactional
public void deleteJob_Vacancy(int job_vacancy_id) {
	Job_Vacancy job_vac = this.hibernateTemplate.load(Job_Vacancy.class,job_vacancy_id);
	this .hibernateTemplate.delete(job_vac);	
}


// get the single job_vacancy
public Job_Vacancy getJob_Vacancy(int job_vacancy_id) {
	return this .hibernateTemplate.get(Job_Vacancy.class,job_vacancy_id);
}



}
	}

		
	
		
		/*
		public interface Job_VacancyDao {

			public List<Job_Vacancy> job_vacList();

		}
		
		
		
		public class Job_VacancyImpl implements Job_VacancyDao {

			private JdbcTemplate jdbcTemp;

			public Job_VacancyImpl(DataSource dataSource) {
				jdbcTemp = new JdbcTemplate(dataSource);
			}

			@Override
			public List<Job_Vacancy> job_vacList() {
				List<Job_Vacancy> list = jdbcTemp.query("SELECT * FROM job_vacancy", new RowMapper<Job_Vacancy>() {

					@Override
					public Job_Vacancy mapRow(ResultSet rs, int rowNum) throws SQLException {
						Job_Vacancy job_vac = new Job_Vacancy();

						job_vac.setExperience_required(rs.getString("experience_required"));
						job_vac.setSalary_lower_range(rs.getString("salary_lower_range"));
						job_vac.setSalary_upper_range(rs.getString("salary_upper_range"));
						job_vac.setVacancy_added_on(rs.getString("vacancy_added_on"));
						job_vac.setIs_active(rs.getInt("is_active"));

						
						
						return job_vac;
					}

				});

				return list;
			}

		}
		*/

