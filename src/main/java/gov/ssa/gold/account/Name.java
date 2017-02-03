package gov.ssa.gold.account;

import java.util.ArrayList;
import java.util.StringTokenizer;

/**
 * 
 * @author Bill Kratz
 * Used to store first, middle and last names in one object
 * and parse components from single string.
 *
 */
public class Name {
	
	private String firstName;
	private String middleName;
	private String lastName;
	private String wholeName;
	
	//CONSTRUCTORS
	public Name(String wholeName) {
		
		this.wholeName = wholeName;
		seperateNames();
		
	}
	
	public Name(String firstName, String lastName) {
		
		this.firstName = removeSpace(firstName);
		this.lastName = removeSpace(lastName);
		createWholeName();
		
	}
	
	public Name(String firstName, String middleName, String lastName) {
		
		this.firstName = removeSpace(firstName);
		this.middleName = removeSpace(middleName);
		this.lastName = removeSpace(lastName);
		createWholeName();
		
	}
	
	//Create whole name as one String based on its parts
	private void createWholeName() {
		
		if (middleName != null) {
			
			wholeName = firstName + " " + middleName + " " + lastName;
			
		} else {
			
			wholeName = firstName + " " + lastName;
		}
		
		
	}
	
	//Separate a whole name (one String) into it's individual parts
	private void seperateNames() {
		
		ArrayList<String> names = parseName(wholeName);
		
		if(names.size() == 1) {
			
			firstName = names.get(0);
			
		} else if(names.size() == 2) {
			
			firstName = names.get(0);
			lastName = names.get(1);
			
		} else {
			
			firstName = names.get(0);
			lastName = names.get(names.size()-1);
			middleName = buildMiddleName(names);
			
		}
	}

	//Create middle name of one or more words
	private String buildMiddleName(ArrayList<String> names) {
		String middle = names.get(1);
		
		if (names.size() > 3){
			
			for (int i=2; i<names.size()-2; i++) {
				
				middle += " " + names.get(i);
				
			}
		}
		
		return middle;
		
	}
	
	//If name is seperated by whitespace, change to dash and save
	private String removeSpace(String name) {
		
		ArrayList<String> names = parseName(name);
		String builtName = names.get(0);
		
		if (names.size() > 1) {
			
			for (int i=1; i<names.size(); i++) {
			
				builtName += "-" + names.get(i);
				
			}
			
		}
		
		return builtName;
			
	}
	
	private ArrayList<String> parseName(String name) {
		ArrayList<String> names = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(name);
		
		while (st.hasMoreTokens()) {
			
			names.add(st.nextToken());
			
		}
		
		return names;
		
	}

	//GETTERS AND SETTERS (ACCESSORS AND MODIFIERS)
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		if (middleName != null) {
			return middleName;
		} else {
			return null;
		}
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		if (lastName != null) {
			return lastName;
		} else {
			return null;
		}
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getWholeName() {
		return wholeName;
	}

	public void setWholeName(String wholeName) {
		this.wholeName = wholeName;
	}
	
}
