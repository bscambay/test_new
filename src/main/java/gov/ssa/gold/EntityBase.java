/**
 * 
 */
package gov.ssa.gold;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * Base entity class
 * @author Chris Vaughan
 */
@MappedSuperclass
public abstract class EntityBase implements Serializable 
{
	private static final long serialVersionUID = 3806535754851030531L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="default_gen")
	@Column(name="id")
	private Long id;
	
	@Column(name="last_modified_by", columnDefinition="bpchar(6)", nullable=false)
	private String lastModifiedBy;
	
	@Column(name = "last_modified", nullable=false)
	private Timestamp lastModified;

	@Column(name="created", nullable=false)
	private Timestamp created;

	@Column(name="created_by", columnDefinition="bpchar(6)", nullable=false)
	private String createdBy;

	/**
	 * 
	 * @return
	 */
	public Long getId()
	{
		return this.id;
	}
	
	/**
	 * 
	 * @param id
	 */
	public void setId(Long id)
	{
		this.id = id;
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
}