/**
 * 
 */
package gov.ssa.gold.menu;

import java.util.List;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import gov.ssa.gold.EntityBase;
import gov.ssa.gold.account.Role;

/**
 * 
 * @author Chris Vaughan
 */
@Entity
@Table(name="dev_menu_item")
@AttributeOverride(name="id", column=@Column(name="dev_menu_item_id"))
@SequenceGenerator(name="default_gen", sequenceName="dev_menu_item_dev_menu_item_id_seq", allocationSize=1)
public class MenuItem extends EntityBase
{
	private static final long serialVersionUID = 6414853291677812151L;
	
	private String name;
	
	@Column(name="menu_text")
	private String text;
	private String description;
	
	@Column(name="help_text")
	private String helpText;
	
	@ManyToOne
	@JoinColumn(name="dev_menu_id", nullable=false)
	private Menu menu;
	
	@Transient
	private List<Role> allowedRoles;
	
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
	 * @return the text
	 */
	public String getText() {
		return text;
	}
	/**
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
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
	 * @return the helpText
	 */
	public String getHelpText() {
		return helpText;
	}
	/**
	 * @param helpText the helpText to set
	 */
	public void setHelpText(String helpText) {
		this.helpText = helpText;
	}
	/**
	 * @return the allowedRoles
	 */
	public List<Role> getAllowedRoles() {
		return allowedRoles;
	}
	/**
	 * @param allowedRoles the allowedRoles to set
	 */
	public void setAllowedRoles(List<Role> allowedRoles) {
		this.allowedRoles = allowedRoles;
	}
}