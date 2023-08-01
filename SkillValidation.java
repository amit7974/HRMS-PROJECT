package validator;

import java.util.ArrayList;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.model.Skill_info;

@Component
public class SkillValidation implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {

		return Skill_info.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Skill_info skill = (Skill_info) target;

		ArrayList<String> sname = skill.getSkill_name();
		ArrayList<String> emonths = skill.getExperience_in_month();

		String n = null;
		String m = null;
		/*
		 * for(String s:list) { j=s; break; }
		 */

		if (!sname.isEmpty()) {
			n = sname.get(0);
		}
		if (!emonths.isEmpty()) {
			m = emonths.get(0);
		}

		if (n == null || n.length() < 3) {
			errors.rejectValue("skill_name", "string.size.three");
		}

		if (m == null) {
			errors.rejectValue("experience_in_month", "string.size.three");
		}
		else
		{
			boolean b = m.matches("^(0|([1-9][0-9]*))$");
			if (b == false) {
				m = "not num";
			}
		}
		
		if (m == "not num") {
			errors.rejectValue("experience_in_month", "enter.numbers");
		}

	}

}
