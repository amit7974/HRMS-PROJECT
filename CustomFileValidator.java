package validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

import com.model.Qualification_info;
import com.model.Skill_info;





@Component
public class CustomFileValidator implements Validator{
public static final String PDF_MIME_TYPE="application/pdf";
public static final String DOCS_MIME_TYPE="application/octet-stream";
public static final long TEN_MB_IN_BYTES = 10485760;
	@Override
	public boolean supports(Class<?> clazz) {
		return Skill_info.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Skill_info skill = (Skill_info)target;
		MultipartFile file = skill.getFile();
		
		if(file.isEmpty()){
			errors.rejectValue("file","upload.file.required");
		}
		else if(!(PDF_MIME_TYPE.equalsIgnoreCase(file.getContentType())||DOCS_MIME_TYPE.equalsIgnoreCase(file.getContentType()))){
			errors.rejectValue("file", "upload.invalid.file.type");
		}
		
		else if(file.getSize() > TEN_MB_IN_BYTES){
			errors.rejectValue("file", "upload.exceeded.file.size");
		}	
	}
} 
