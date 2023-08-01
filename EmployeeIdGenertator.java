package com.custom.id;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

public class EmployeeIdGenertator implements IdentifierGenerator {

	
	public Serializable generate(SessionImplementor session, Object object) throws HibernateException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
		 String prefix = "EMP";
	        Connection connection = session.connection();

	        try {
	            Statement statement=connection.createStatement();

	            ResultSet rs=statement.executeQuery("select max(serial_no) as Id from hrms.employee_details");

	            if(rs.next())
	            {
	                int id=rs.getInt(1)+1;
	                 
	                String generatedId = prefix + String.format("%04d", id);;
	                System.out.println("Generated Id: " + generatedId);
	                return generatedId;
	            }
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
		return null;
	}

}
