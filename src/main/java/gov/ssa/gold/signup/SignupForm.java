package gov.ssa.gold.signup;

import gov.ssa.gold.account.Account;

public class SignupForm {

	String pin;

    String password;
    
    String confirmPassword;
    
    String name;

    public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getConfirmPassword() {
		return confirmPassword;
	}
	
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Account createAccount() {
        return new Account(getPin(), getPassword(), getName());
	}
	
}
	
