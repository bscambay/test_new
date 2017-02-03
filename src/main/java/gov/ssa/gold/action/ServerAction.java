/**
 * 
 */
package gov.ssa.gold.action;

import java.util.List;
import java.util.Map;

/**
 * @author Chris Vaughan
 *
 */
public abstract class ServerAction extends Action 
{
	protected ServerAction(String name, List<ActionArgumentDefinition<?>> arguments) 
	{
		super(name, arguments);
	}
	
	/* (non-Javadoc)
	 * @see gov.ssa.gold.action.Action#getType()
	 */
	@Override
	public ActionType getType() 
	{
		return ActionType.Server;
	}
	
	/**
	 * Execute the action
	 * @param arguments Map of arguments for action
	 * @throws ActionException
	 */
	public abstract void execute(Map<String, ?> arguments) throws ActionException;
}