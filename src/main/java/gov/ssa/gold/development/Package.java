/**
 * 
 */
package gov.ssa.gold.development;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import gov.ssa.gold.development.configuration.Menu;

/**
 * @author Chris Vaughan
 */
@Entity
@Table(name="dev_package")
public class Package 
{
	@Id
	@SequenceGenerator(name="dev_package_dev_package_id_seq", sequenceName="dev_package_dev_package_id_seq", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="dev_package_dev_package_id_seq")
	@Column(name="dev_package_id", updatable=false)
	private Long id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="description")
	private String description;
	
	@Transient
	private Menu sideMenu;
	
	@Column(name = "last_modified", nullable=false)
	private Timestamp lastModified;

	@Column(name="last_modified_by", columnDefinition="bpchar(6)")
	private String lastModifiedBy;
		
	@Column(name="created", nullable=false)
	private Timestamp created;
	
	@Column(name="created_by", columnDefinition="bpchar(6)")
	private String createdBy;
	
	/**
	 * @return the id
	 */
	public Long getId() 
	{
		return id;
	}
	
	/**
	 * @param id the id to set
	 */
	public void setId(Long id) 
	{
		this.id = id;
	}
	
	/**
	 * @return the name
	 */
	public String getName() 
	{
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) 
	{
		this.name = name;
	}

	/**
	 * @return the sideMenu
	 */
	public Menu getSideMenu() 
	{
		return sideMenu;
	}

	/**
	 * @param sideMenu the sideMenu to set
	 */
	public void setSideMenu(Menu sideMenu) 
	{
		this.sideMenu = sideMenu;
	}

	/**
	 * @return the description
	 */
	public String getDescription() 
	{
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) 
	{
		this.description = description;
	}

	/**
	 * @return the lastModified
	 */
	public Timestamp getLastModified() 
	{
		return lastModified;
	}

	/**
	 * @param lastModified the lastModified to set
	 */
	public void setLastModified(Timestamp lastModified) 
	{
		this.lastModified = lastModified;
	}

	/**
	 * @return the lastModifiedBy
	 */
	public String getLastModifiedBy()
	{
		return lastModifiedBy;
	}

	/**
	 * @param lastModifiedBy the lastModifiedBy to set
	 */
	public void setLastModifiedBy(String lastModifiedBy) 
	{
		this.lastModifiedBy = lastModifiedBy;
	}

	/**
	 * @return the created
	 */
	public Timestamp getCreated()
	{
		return created;
	}

	/**
	 * @param created the created to set
	 */
	public void setCreated(Timestamp created)
	{
		this.created = created;
	}

	/**
	 * @return the createdBy
	 */
	public String getCreatedBy()
	{
		return createdBy;
	}

	/**
	 * @param createdBy the createdBy to set
	 */
	public void setCreatedBy(String createdBy) 
	{
		this.createdBy = createdBy;
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