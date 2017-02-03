/**
 * 
 */
package gov.ssa.gold.reference;

import java.sql.Timestamp;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import gov.ssa.gold.EntityBase;

/**
 * 
 * @author Chris Vaughan
 */
@Entity
@Table(name="ref_type_value")
@AttributeOverride(name="id", column=@Column(name="ref_type_value_id"))
@SequenceGenerator(name="default_gen", sequenceName="ref_type_value_ref_type_value_id_seq", allocationSize=1)
public class ReferenceTypeValue extends EntityBase
{
	private static final long serialVersionUID = 4409546395441426589L;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ref_type_id")
	private ReferenceType referenceType;

	@Column(name="text")
	private String text;
	
	@Column(name="ordinal")
	private Integer ordinal;
	
	@Column(name="act_start_date")
	private Timestamp activeStartDate = new Timestamp(System.currentTimeMillis());
	
	@Column(name="act_end_date")
	private Timestamp activeEndDate;
	
	/**
	 * 
	 * @return
	 */
	public ReferenceType getReferenceType()
	{
		return this.referenceType;
	}
	
	/**
	 * 
	 * @param referenceType
	 */
	public void setReferenceType(ReferenceType referenceType)
	{
		this.referenceType = referenceType;
	}
		
	/**
	 * @return the text
	 */
	public String getText() 
	{
		return text;
	}

	/**
	 * @param text the text to set
	 */
	public void setText(String text) 
	{
		this.text = text;
	}

	/**
	 * @return the ordinal
	 */
	public Integer getOrdinal()
	{
		return ordinal;
	}

	/**
	 * @param ordinal the ordinal to set
	 */
	public void setOrdinal(Integer ordinal) 
	{
		this.ordinal = ordinal;
	}

	/**
	 * @return the activeStartDate
	 */
	public Timestamp getActiveStartDate() 
	{
		return activeStartDate;
	}

	/**
	 * @param activeStartDate the activeStartDate to set
	 */
	public void setActiveStartDate(Timestamp activeStartDate)
	{
		this.activeStartDate = activeStartDate;
	}

	/**
	 * @return the activeEndDate
	 */
	public Timestamp getActiveEndDate()
	{
		return activeEndDate;
	}

	/**
	 * @param activeEndDate the activeEndDate to set
	 */
	public void setActiveEndDate(Timestamp activeEndDate)
	{
		this.activeEndDate = activeEndDate;
	}

	/**
	 * Tests whether the value is currently active (based on current date & time.)
	 * @return
	 */
	public boolean isActive()
	{
		if (this.activeStartDate != null)
		{
			if (this.activeEndDate != null)
			{
				Timestamp now = new Timestamp(System.currentTimeMillis());
				
				return (this.activeStartDate.compareTo(now) >= 0 && 
						this.activeEndDate.compareTo(now) <= 0);
			}
			else
			{
				return (this.activeStartDate.compareTo(new Timestamp(System.currentTimeMillis())) >= 0);
			}
		}
		else
		{
			if (this.activeEndDate != null)
			{
				return (this.activeEndDate.compareTo(new Timestamp(System.currentTimeMillis())) <= 0);
			}
			else
			{
				// If no start or end date, assume inactive
				return false;
			}
		}
	}
}