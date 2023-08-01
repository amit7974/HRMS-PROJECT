package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.model.Cities;
import com.model.Country;
import com.model.State;
import com.service.DropDownService;
@Repository("drop")
public class DropDownDao implements DropDownService{
@Autowired
HibernateTemplate hibernateTemplate;
	    Connection con;
	    PreparedStatement pst;
	    String query;
	    ResultSet rs;
	    
	    public void conn(Connection con) {
	        this.con = con;
	    }
	    
	    public List<Country> getAllCountry(){
	        List<Country> list  = new ArrayList<>();
	        try{
	            query = "select * from country";
	            pst = this.con.prepareStatement(query);
	            rs = pst.executeQuery();
	            while(rs.next()){
	                Country country = new Country();
	                country.setCountry_id(rs.getInt("country_id"));
	                country.setCountry_name(rs.getString("country_name"));
	                country.setCountry_code(rs.getString("country_code"));
	                list.add(country);
	            }
	        }catch(SQLException e){
	            e.printStackTrace();
	        }
	        return list;
	    }
	    
	    
	    public List<State> getStateByCountryId(String name){
	        List<State> list_state = new ArrayList<>();
	        Session session=hibernateTemplate.getSessionFactory().openSession();
	        Query q=session.createSQLQuery("select * from state where country_name='"+name+"'");
	        List<Object[]> list = q.getResultList();
	        
	        for(int i=0;i<list.size();i++)
	        {
	        	State state = new State();
	        	Object[] obj= list.get(i);
	        	state.setState_id(Integer.parseInt(obj[0].toString()));
	        	state.setCountry_id(Integer.parseInt(obj[1].toString()));
	        	state.setState_name(obj[2].toString());
	        	list_state.add(state);
	        }
	        
	        return list_state;
	    }
	    
	    
	    public List<Cities> getCityByStateId(String name){
	        List <Cities>city=new ArrayList<Cities>();
	        Session session=hibernateTemplate.getSessionFactory().openSession();
	        Query q=session.createSQLQuery("select * from cities where state_name='"+name+"'");
	        List<Object[]> list = q.getResultList();
	        
	        for(int i=0;i<list.size();i++)
	        {
	        	Cities cities=new Cities();
	        	Object[] obj= list.get(i);
	        	cities.setCity_id(Integer.parseInt(obj[0].toString()));
	        	cities.setCity_name(obj[1].toString());
	        	cities.setState_name(obj[2].toString());
	        	cities.setCountry_id(Integer.parseInt(obj[3].toString()));
	        	cities.setState_id(Integer.parseInt(obj[4].toString()));
	        	city.add(cities);
	        }
	        
	      
	       
	        return city;
	    }
	    @Override
		public List<String> getCountries() {
			
			Session s=this.hibernateTemplate.getSessionFactory().openSession();
			Query q=s.createSQLQuery("select distinct country_name from country");
			List<String> country= q.getResultList();
			return country;
		}
	
	    @Override
		public List<String> getStates(String country) {
			
			Session s=this.hibernateTemplate.getSessionFactory().openSession();
			Query q=s.createSQLQuery("select state_name from state where country_name='"+country+"'");
			List<String> state= q.getResultList();
			return state;
		}
		
		@Override
		public List<String> getCities(String state) {
			
			Session s=this.hibernateTemplate.getSessionFactory().openSession();
			Query q=s.createSQLQuery("select city_name from cities where state_name='"+state+"'");
			List<String> city= q.getResultList();
			return city;
		}
		
	    
	    
	}
