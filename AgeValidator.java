package validator;

import java.time.LocalDate;
import java.time.Period;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.model.User_info;
@Component
public class AgeValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return User_info.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User_info candidate_profile=(User_info) target;
		LocalDate date=candidate_profile.getDob();
		int age=0;
		
		
		if(date!=null)
		{
			
			int day =date.getDayOfMonth();
			int year = date.getYear();
			int month = date.getMonthValue();
		  LocalDate time=LocalDate.of(year, month, day); 
		  LocalDate d=LocalDate.now();
		  Period p=Period.between(time,d);
		 age=p.getYears();
		
		 
		}
		 if(date==null)
		 {
			 errors.rejectValue("dob","age.not.selected");
		 }
		else if(age<14)
		 {
			 errors.rejectValue("dob", "age.limit");
		 }
		
	}

}
