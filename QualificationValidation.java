package validator;

import java.util.ArrayList;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.model.Qualification_info;
@Component
public class QualificationValidation implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Qualification_info.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Qualification_info candi=(Qualification_info) target;
		ArrayList<String> qualname=candi.getQualification_name();
		ArrayList<String> qualdesc=candi.getQualification_Description();
		ArrayList<String> qualmarks=candi.getMarks_Detail();
		String n=null;
		String d=null;
		String m=null;
		/*
		 * for(String s:list) { j=s; break; }
		 */
		
		if(!qualname.isEmpty())
		{
			n=qualname.get(0);	
		}
		if(!qualdesc.isEmpty())
		{
			d=qualdesc.get(0);
		}
		if(!qualmarks.isEmpty())
		{
			m=qualmarks.get(0);
		}
		
		if(n==null || n.length()<3)
		 {
			 errors.rejectValue("qualification_name","string.size.three");
		 }
		if(d==null || d.length()<3)
		 {
			 errors.rejectValue("Qualification_Description","string.size.three");
		 }
		if(m==null)
		 {
			 errors.rejectValue("Marks_Detail","enter.valid");
		 }
		else
		{
			boolean b = m.matches("^(0|([1-9][0-9]*))(\\.[0-9]+)?(%?)$");
			if (b == false) {
				m = "not num";
			}
		}
		
		if (m == "not num") {
			errors.rejectValue("Marks_Detail", "enter.valid");
		}

		
		
		
	}

}
