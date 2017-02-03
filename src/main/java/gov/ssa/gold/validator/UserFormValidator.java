package gov.ssa.gold.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import gov.ssa.gold.account.Account;
import gov.ssa.gold.account.AccountRepository;
import gov.ssa.gold.account.Name;
import gov.ssa.gold.account.UserService;
import gov.ssa.gold.signup.SignupForm;

@Component
public class UserFormValidator implements Validator {

	@Autowired
	UserService userService;
	
	@Autowired
	AccountRepository actRep;

	@Override
	public boolean supports(Class<?> clazz) {
		return SignupForm.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		SignupForm signupForm = (SignupForm) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pin", "NotEmpty.userForm.pin");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty.userForm.password");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword","NotEmpty.userForm.confirmPassword");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.userForm.name");

		if (!signupForm.getPassword().equals(signupForm.getConfirmPassword())) {
			errors.rejectValue("confirmPassword", "Diff.userform.confirmPassword");
		}
		
		if (signupForm.getPin().length() != 6) {
			errors.rejectValue("pin", "Valid.userForm.pin");
		} else {
			if (isDuplicatePin(signupForm.getPin())) {
				errors.rejectValue("pin", "Duplicate.userForm.pin");
			}
		}
		
		if (signupForm.getName().length() != 0) {
			if (!isNameValid(signupForm.getName())) {
				errors.rejectValue("name", "Valid.userForm.name");
			}
		}

	}

	private boolean isNameValid(String name) {
		
		boolean isValid = false;
		Name testName = new Name(name);
		
		if(testName.getLastName() != null) {
			
			isValid = true;
			
		}
		
		return isValid;
	}
	
	private boolean isDuplicatePin(String pin) {
		
		boolean isDuplicate = false;
		
		try {
			Account user = actRep.findByPin(pin);
			if (user.getPin() != null) {
				isDuplicate = true;
			}
		} catch (NullPointerException e){}
		
		return isDuplicate;
	}

}
