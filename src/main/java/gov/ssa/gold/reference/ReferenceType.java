/**
 * 
 */
package gov.ssa.gold.reference;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.util.CollectionUtils;

import gov.ssa.gold.EntityBase;

/**
 * 
 * @author Chris Vaughan
 */
@Entity
@Table(name="ref_type")
@AttributeOverride(name="id", column=@Column(name="ref_type_id"))
@SequenceGenerator(name="default_gen", sequenceName="ref_type_ref_type_id_seq", allocationSize=1)
public class ReferenceType extends EntityBase
{
	private static final long serialVersionUID = -7968109046295829776L;
	
	@Column(name="name")
	private String name;
	
	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="ref_type_id")
	private Set<ReferenceTypeValue> values = new HashSet<ReferenceTypeValue>(0);

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
	 * Returns comma-delimited list of values
	 * @return
	 */
	public String getValuesAsString() 
	{
		if (!CollectionUtils.isEmpty(values))
		{
			String comma = ", ";
			String vals = values.stream().sorted((v1, v2) -> {
				if (v1 != null && v2 != null && v1.getOrdinal() != null)
				{
					return v1.getOrdinal().compareTo(v2.getOrdinal());
				}
				else
				{
					if (v1 != null && v2 != null && v2.getOrdinal() != null)
					{
						return v2.getOrdinal().compareTo(v1.getOrdinal()) * -1;
					}
					else
					{
						return 0;
					}
				}
			}).map(ReferenceTypeValue::getText).reduce("", (s1, s2) -> String.format("%s%s%s", s1, comma, s2));
			
			if (vals.startsWith(comma))
			{
				vals = vals.substring(comma.length());
			}
			
			return vals;
		}
		else
		{
			return "None";
		}
	}
	
	/**
	 * @return the values
	 */
	public Set<ReferenceTypeValue> getValues() 
	{
		return values;
	}

	/**
	 * @param values the values to set
	 */
	public void setValues(Set<ReferenceTypeValue> values) 
	{
		this.values = values;
	}
}