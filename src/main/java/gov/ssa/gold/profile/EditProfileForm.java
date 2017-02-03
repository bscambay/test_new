package gov.ssa.gold.profile;

import gov.ssa.gold.account.Name;

/**
 * 
 * @author Bill Kratz
 * Creates object based on data collected from edit profile form
 *
 */
public class EditProfileForm {
	
	String firstName;
	String middleName;
	String lastName;
	String deskPhone;
	String emailAddress;
	String jobTitle;
	String division;
	String branch;
	String physicalLocation;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getMiddleName() {
		return middleName;
	}
	
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getWholeName() {
		String wholeName;
		if(middleName.length() == 0) {
			Name name = new Name(firstName, lastName);
			wholeName = name.getWholeName();
		} else {
			Name name = new Name(firstName, middleName, lastName);
			wholeName = name.getWholeName();
		}
		return wholeName;
	}

	public String getDeskPhone() {
		return deskPhone;
	}

	public void setDeskPhone(String deskPhone) {
		this.deskPhone = deskPhone;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getPhysicalLocation() {
		return physicalLocation;
	}

	public void setPhysicalLocation(String physicalLocation) {
		this.physicalLocation = physicalLocation;
	}
	
	public String toString(){
		return "fName: " + getFirstName() + ", " + "Phone: " + getDeskPhone() + ", " + "Email: " + getEmailAddress() + "Job: " + getJobTitle() + "," +
				"Division: " + getDivision() + ", " + "Location: " + getPhysicalLocation();
	}

}
