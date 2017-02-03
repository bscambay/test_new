package gov.ssa.gold.account;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "account")
@NamedQueries({
		@NamedQuery(name = Account.FIND_BY_PIN, query = "select a from Account a where a.pin = :pin"),
		@NamedQuery(name=Account.FIND_ALL, query="SELECT a FROM Account a")
})
public class Account implements java.io.Serializable {

	private static final long serialVersionUID = -148545817118056006L;

	public static final String FIND_ALL = "Account.findAll";
	public static final String FIND_BY_PIN = "Account.findByPin";
	
	public static final String EMAIL_DOMAIN = "@ssa.gov";

	@Id
	@Column(name = "account_pin", columnDefinition = "bpchar(6)")
	private String pin;
	
	@JsonIgnore
	private String password;

	@Column(name = "name")
	private String name;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(
			name = "account_role",
			joinColumns = @JoinColumn(name = "account_pin", referencedColumnName = "account_pin"),
			inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "role_id"))
	private List<Role> roles;
	
	//desk_phone, email_address, job_title, division, branch and physical_location may be left null
	@Column(name = "desk_phone")
	private String deskPhone;
	
	@Column(name = "email_address")
	private String emailAddress;
	
	@Column(name = "job_title")
	private String jobTitle;
	
	@Column(name = "division")
	private String division;
	
	@Column(name = "branch")
	private String branch;
	
	@Column(name = "physical_location")
	private String physicalLocation;

    protected Account() {

	}
	
	public Account(String pin, String password, String name) {

		this.pin = pin;
		this.password = password;
		this.name = name;
	}

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	/**
	 * Returns role names
	 * @return
	 */
	public String getRoleNames()
	{
		String roleNames = null;
		
		if (!CollectionUtils.isEmpty(this.roles))
		{
			String comma = ", ";
			
			roleNames = this.roles.stream().map(Role::toString).reduce(comma, String::concat);
			
			if (roleNames.startsWith(comma))
			{
				roleNames = roleNames.substring(comma.length());
			}
		}
		
		if (StringUtils.isEmpty(roleNames))
		{
			return "None";
		}
		else
		{
			return roleNames;
		}
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
	
	public String getShortEmail() {
		if (emailAddress != null){
			StringBuilder sb = new StringBuilder(emailAddress);
			sb.delete(sb.length()-EMAIL_DOMAIN.length(), sb.length());
			return sb.toString();
		} else {
			return null;
		}
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return String.format("%s (%s)", this.getName(), this.getPin());
		
	}
}
