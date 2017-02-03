/**
 * 
 */
package gov.ssa.gold.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.util.CollectionUtils;

/**
 * 
 * @author Chris Vaughan
 */
public class ActionArgumentDefinition<T>
{
	private String name;
	private String description;
	private Class<T> type;
	private Boolean required = Boolean.FALSE;
	private List<T> validValues = new ArrayList<T>();
	private T minValue;
	private T maxValue;
	
	public ActionArgumentDefinition(Class<T> type)
	{
		this.type = type;
	}
	
	public ActionArgumentDefinition(String name, Class<T> type)
	{
		this.type = type;
		this.name = name;
	}
	
	public ActionArgumentDefinition(String name, Boolean required, Class<T> type)
	{
		this.type = type;
		this.name = name;
		this.required = required;
	}
	
	public ActionArgumentDefinition(String name, Boolean required, List<T> validValues, Class<T> type)
	{
		this.type = type;
		this.name = name;
		this.required = required;
		this.validValues = validValues;
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
	 * @return the required
	 */
	public Boolean getRequired() {
		return required;
	}
	/**
	 * @param required the required to set
	 */
	public void setRequired(Boolean required) {
		this.required = required;
	}
	/**
	 * @return the validValues
	 */
	public List<T> getValidValues() {
		return validValues;
	}
	/**
	 * @param validValues the validValues to set
	 */
	public void setValidValues(List<T> validValues) {
		this.validValues = validValues;
	}
	/**
	 * @return the minValue
	 */
	public T getMinValue() {
		return minValue;
	}
	/**
	 * @param minValue the minValue to set
	 */
	public void setMinValue(T minValue) {
		this.minValue = minValue;
	}
	/**
	 * @return the maxValue
	 */
	public T getMaxValue() {
		return maxValue;
	}
	/**
	 * @param maxValue the maxValue to set
	 */
	public void setMaxValue(T maxValue) {
		this.maxValue = maxValue;
	}
	
	/**
	 * Type of the argument
	 * @return
	 */
	public Class<T> getType()
	{
		return this.type;
	}
	
	/**
	 * Validate a value against the definition
	 * @param value
	 * @throws ActionArgumentException
	 */
	void validateValue(Object value) throws ActionArgumentException
	{
		if (!getType().equals(value.getClass()))
		{
			throw new ActionArgumentException(getName(),
					String.format("Incorrect data type: expected %s; found %s", 
							getType().getCanonicalName(), value.getClass().getCanonicalName()));
		}
		
		if (!CollectionUtils.isEmpty(validValues))
		{
			if (!validValues.contains(value))
			{
				throw new ActionArgumentException(getName(), 
						String.format("\"%s\" is not a valid value", value.toString()));
			}
		}
		else if (value instanceof Comparable<?> && 
				getMinValue() != null && getMaxValue() != null)
		{
			@SuppressWarnings("unchecked")
			Comparable<Object> c = (Comparable<Object>) value;
					
			if (c.compareTo(getMinValue()) < 0 || c.compareTo(getMaxValue()) > 0)
			{
				throw new ActionArgumentException(getName(), String.format(
						"Value \"%s\" not between \"%s\" and \"%s\"", 
						getMinValue().toString(), getMaxValue().toString()));
			}
		}

	}
}