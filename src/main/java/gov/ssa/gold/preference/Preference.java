package gov.ssa.gold.preference;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="preference")
public class Preference implements Serializable {

/**
	 * 
	 */
	private static final long serialVersionUID = 2263924654279490935L;

/**
	 * 
	 */
	
	@Id
	@SequenceGenerator(name="preference_preference_id_seq", sequenceName="preference_preference_id_seq", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="preference_preference_id_seq")
	
	@Column(name="preference_id", updatable=false)
	private Long preferenceId;
	
	@Column(name = "account_pin", columnDefinition = "bpchar(6)")
	private String accountPin;
	
	@Column(name="bg_color")
	private Long backgroundColor;
	
	@Column(name = "font_color")
	private Long fontColor;
	
	@Column(name = "font_size")
	private Long fontSize;
	
	@Column(name = "font_family")
	private Long fontFamily;
	
	@Column(name = "compliance_508")
	private Boolean compliance508;
	
	@Column(name="theme_color")
	private String themeColor;
	
	public Preference() {
		// TODO Auto-generated constructor stub
	}

	@Override	
	public String toString() { 
	    return "ID: '" + this.preferenceId + "' , accountPin: '" + this.accountPin + "' , bgColor: '" + this.backgroundColor + 
	    		"' , fontColor: '" + this.fontColor + "' , fontSize: '" + this.fontSize + "' , fontFamily: '" + this.fontFamily +
	    		"' , 508Compliance: '" + this.compliance508 + "' , themeColor: '" + this.themeColor + "'";
	} 
	
	public Long getPreferenceId() {
		return preferenceId;
	}


	public void setPreferenceId(Long preference_id) {
		this.preferenceId = preference_id;
	}


	public String getAccountPin() {
		return accountPin;
	}


	public void setAccountPin(String account_pin) {
		this.accountPin = account_pin;
	}


	public Long getBackgroundColor() {
		return backgroundColor;
	}


	public void setBackgroundColor(Long bg_color) {
		this.backgroundColor = bg_color;
	}


	public Long getFontColor() {
		return fontColor;
	}


	public void setFontColor(Long font_color) {
		this.fontColor = font_color;
	}
	
	
	
	public Long getFontSize() {
		return fontSize;
	}


	public void setFontSize(Long fontSize) {
		this.fontSize = fontSize;
	}


	public Long getFontFamily() {
		return fontFamily;
	}


	public void setFontFamily(Long fontFamily) {
		this.fontFamily = fontFamily;
	}

	public Boolean getCompliance508() {
		return compliance508;
	}

	public void setCompliance508(Boolean compliance508) {
		this.compliance508 = compliance508;
	}
	
	public String findColor(Long colorIn) {
			   if (colorIn == 0) {
			return "Black";
		} else if (colorIn == 1) {
			return "White";
		} else if (colorIn == 2) {
			return "Blue";
		} else if (colorIn == 3) {
			return "Yellow";
		} else if (colorIn == 4) {
			return "Red";
		} else if (colorIn == 5) {
			return "Green";
		} else if (colorIn == 6) {
			return "Purple";
		} else if (colorIn == 7) {
			return "Orange";
		} else if (colorIn == 8) {
			return "Grey";
		} else if (colorIn == 9) {
			return "Gold";
		} else {
			return "Error";
		}
	}
	
	public String findFamily(Long familyIn) {	
		if (familyIn == 0) {
			return "Helvetica Neue";
		} else if (familyIn == 1) {
			return "Times New Roman";
		} else if (familyIn == 2) {
			return "Georgia";
		} else if (familyIn == 3) {
			return "Arial";
		} else if (familyIn == 4) {
			return "Arial Black";
		} else if (familyIn == 5) {
			return "Comic Sans MS";
		} else if (familyIn == 6) {
			return "Impact";
		} else if (familyIn == 7) {
			return "Verdana";
		} else if (familyIn == 8) {
			return "Courier New";
		} else if (familyIn == 9) {
			return "Lucida Console";
		} else {
			return "Error";
		}
	}
	
	public String findSize(Long fontSizeIn) {	
		if (fontSizeIn == 12) {
			return "Small";
		} else if (fontSizeIn == 14) {
			return "Medium";
		} else if (fontSizeIn == 22) {
			return "Large";
		} else if (fontSizeIn == 30) {
			return "Extra Large";
		} else {
			return "Error";
	}
}

	/**
	 * @return the themeColor
	 */
	public String getThemeColor() 
	{
		return themeColor;
	}

	/**
	 * @param themeColor the themeColor to set
	 */
	public void setThemeColor(String themeColor)
	{
		this.themeColor = themeColor;
	}
}
	
	