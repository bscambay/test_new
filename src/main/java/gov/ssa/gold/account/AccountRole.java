/**
 * 
 */

package gov.ssa.gold.account;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="account_role")


public class AccountRole implements Serializable
{	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1763914913322205193L;
	
	
	@Id
	@SequenceGenerator(name="account_role_account_role_id_seq", sequenceName="account_role_account_role_id_seq", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="account_role_account_role_id_seq")
	@Column(name="account_role_id", updatable=false)
	private Long id;
	
	
	@Column(name = "account_pin", columnDefinition = "bpchar(6)")
	private String accountPin; 
	
	@Column(name = "role_id", columnDefinition = "int8")
	private Long roleId;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getAccountPin() {
		return accountPin;
	}

	public void setAccountPin(String accountPin) {
		this.accountPin = accountPin;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId2) {
		this.roleId = roleId2;
	}
	
	@Override
	public String toString() {
		return String.format("ID: %d, Account PIN: %s, Role ID: %s", 
				this.id, this.accountPin, this.roleId);
	}
	
	
}
