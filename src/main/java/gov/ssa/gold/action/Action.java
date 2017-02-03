/**
 * 
 */
package gov.ssa.gold.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.util.CollectionUtils;

/**
 * @author Chris Vaughan
 *
 */
public abstract class Action 
{
	private String name;
	private List<ActionArgumentDefinition<?>> argumentDefinitions = new ArrayList<ActionArgumentDefinition<?>>();
		
	/**
	 * Constructor
	 * @param name
	 * @param argumentDefinitions
	 */
	protected Action(String name, List<ActionArgumentDefinition<?>> argumentDefinitions)
	{
		this.name = name;
		this.argumentDefinitions = argumentDefinitions;
	}
	
	/**
	 * Constructor
	 * @param name
	 */
	protected Action(String name)
	{
		this.name = name;
	}
	
	/**
	 * Name of the action
	 * @param name
	 */
	protected void setName(String name)
	{
		this.name = name;
	}
	
	/**
	 * Name of the action
	 * @return
	 */
	public String getName()
	{
		return this.name;
	}
	
	/**
	 * Type of the action
	 * @return
	 */
	public abstract ActionType getType();

	/**
	 * @return the argument definitions
	 */
	public List<ActionArgumentDefinition<?>> getArgumentDefinitions() 
	{
		return argumentDefinitions;
	}

	/**
	 * @param argument definitions the argument definitions to set
	 */
	protected void setArgumentDefinitions(List<ActionArgumentDefinition<?>> argumentDefinitions) 
	{
		this.argumentDefinitions = argumentDefinitions;
	}
	
	/**
	 * Validate the arguments against the action's argument definitions
	 * @param arguments
	 * @throws ActionException
	 */
	protected void validateArguments(Map<String, ?> arguments) throws ActionException
	{
		if (CollectionUtils.isEmpty(this.argumentDefinitions) && 
			arguments != null && arguments.size() > 0)
		{
			throw new ActionException("Arguments provided but none expected");
		}
		else if (!CollectionUtils.isEmpty(this.argumentDefinitions))
		{
			if (arguments == null || arguments.size() == 0)
			{
				if (this.argumentDefinitions.stream().anyMatch(a -> a.getRequired()))
				{
					throw new ActionException("Required arguments were not provided");
				}
			}
			
			for (ActionArgumentDefinition<?> def : this.argumentDefinitions)
			{
				if (arguments.containsKey(def.getName()))
				{					
					Object value = arguments.get(def.getName());
					
					try
					{
						def.validateValue(value);
					}
					catch (ActionArgumentException ex)
					{
						throw new ActionException(ex.getLocalizedMessage(), ex);
					}
				}
				else if (def.getRequired())
				{
					throw new ActionException(String.format(
							"Required argument %s was not provided", def.getName()));
				}
			}
		}
	}
}