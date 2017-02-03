/**
 * 
 */
package gov.ssa.gold.account;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedNativeQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

@Entity
@Table(name="role")
@NamedNativeQuery(name = Role.FIND_ROLE_ACCOUNT, query = "SELECT string_agg(account.name, ', ') AS employee_names" + 
        " FROM account_role inner join account on account.account_pin = account_role.account_pin" +
        " where account_role.role_id = ?1 GROUP BY account_role.role_id;")
public class Role implements Serializable
{
	private static final long serialVersionUID = -4805173183653649376L;
	
	public static final String FIND_ROLE_ACCOUNT = "Role.findRoleAccounts";
	
	@Id
	@SequenceGenerator(name="role_role_id_seq", sequenceName="role_role_id_seq", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="role_role_id_seq")
	@Column(name="role_id", updatable=false)
	private Long id;
	
	private String name;
	
	private String description;
	
	@ManyToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	@JoinTable(name="account_role", joinColumns={
			@JoinColumn(name="role_id", nullable=false, updatable=false)
	}, inverseJoinColumns={
			@JoinColumn(name="account_pin", nullable=false, updatable=false)
	})
	private Set<Account> accounts = new HashSet<Account>(0);

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the accounts
	 */
	public Set<Account> getAccounts() {
		return accounts;
	}
	
	/**
	 * Returns the accounts as a comma-delimited string
	 * @return
	 */
	public String getAccountNames()
	{
		String accountNames = null;
		
		if (!CollectionUtils.isEmpty(this.accounts))
		{
			String comma = ", ";
			
			accountNames = this.accounts.stream().map(Account::toString).reduce(comma, String::concat);
			
			if (accountNames.startsWith(comma))
			{
				accountNames = accountNames.substring(comma.length());
			}
		}
		
		if (StringUtils.isEmpty(accountNames))
		{
			accountNames = "None";
		}
		
		return accountNames;
	}

	/**
	 * @param accounts the accounts to set
	 */
	public void setAccounts(Set<Account> accounts) {
		this.accounts = accounts;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() 
	{
		return this.name;
	}
}