/**
 * 
 */
package gov.ssa.gold.menu;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.AttributeOverride;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import gov.ssa.gold.EntityBase;
import gov.ssa.gold.account.Role;

/**
 * 
 * @author Chris Vaughan
 */
@Entity
@Table(name="dev_menu")
@AttributeOverride(name="id", column=@Column(name="dev_menu_id"))
@SequenceGenerator(name="default_gen", sequenceName="dev_menu_dev_menu_id_seq", allocationSize=1)
public class Menu extends EntityBase
{
	private static final long serialVersionUID = 3591976177371872946L;
	
	private String name;
	private String description;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="dev_package_id")
	private gov.ssa.gold.development.Package _package;
	
	@ManyToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	@JoinTable(name="dev_menu_role",
			joinColumns=@JoinColumn(name="dev_menu_id"),
			inverseJoinColumns=@JoinColumn(name="role_id"))
	private Set<Role> roles = new HashSet<Role>(0);

	@OneToMany(mappedBy="menu", cascade=CascadeType.ALL)
	private Set<MenuItem> items;
	
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
	 * 
	 * @return
	 */
	public String getDescription()
	{
		return description;
	}
	
	/**
	 * 
	 * @param description
	 */
	public void setDescription(String description)
	{
		this.description = description;
	}
	
	/**
	 * Returns a comma-delimited list of role names
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
			roleNames = "None";
		}
		
		return roleNames;
	}
	
	/**
	 * @return the allowed roles
	 */
	public Set<Role> getRoles() {
		return roles;
	}
	/**
	 * @param roles the allowed roles to set
	 */
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	/**
	 * @return the items
	 */
	public Set<MenuItem> getItems() {
		return items;
	}
	/**
	 * @param items the items to set
	 */
	public void setItems(Set<MenuItem> items) {
		this.items = items;
	}
	/**
	 * @return the package
	 */
	public gov.ssa.gold.development.Package getPackage() {
		return _package;
	}
	/**
	 * @param _package the package to set
	 */
	public void setPackage(gov.ssa.gold.development.Package _package) {
		this._package = _package;
	}
}