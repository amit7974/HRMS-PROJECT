package validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

import com.model.Skill_info;
import com.model.User_info;





@Component
public class ImageValidator implements Validator{
public static final String PNG_MIME_TYPE="image/png";
public static final String JPG_MIME_TYPE="image/jpeg";
public static final long ONE_MB_IN_BYTES = 1048576;
	@Override
	public boolean supports(Class<?> clazz) {
		return Skill_info.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User_info emp = (User_info)target;
		MultipartFile file = emp.getFile();
		
		if(file.isEmpty()){
			errors.rejectValue("file","upload.file.required");
		}
		else if(!(PNG_MIME_TYPE.equalsIgnoreCase(file.getContentType())||JPG_MIME_TYPE.equalsIgnoreCase(file.getContentType()))){
			errors.rejectValue("file", "upload.invalid.image.type");
		}
		
		else if(file.getSize() > ONE_MB_IN_BYTES){
			errors.rejectValue("file", "upload.exceeded.file.size");
		}	
	}
} 
