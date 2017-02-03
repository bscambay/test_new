/**
 * 
 */
package gov.ssa.gold.action;

import java.util.List;

/**
 * 
 * @author Chris Vaughan
 *
 */
public abstract class ClientAction extends Action 
{
	protected ClientAction(String name, 
			List<ActionArgumentDefinition<?>> argumentDefinitions)
	{
		super(name, argumentDefinitions);		
	}
	
	/* (non-Javadoc)
	 * @see gov.ssa.gold.action.Action#getType()
	 */
	@Override
	public ActionType getType() {
		
		return ActionType.Client;
	}
	
	/**
	 * Renders the client action
	 * @return
	 */
	public abstract String render();
	
	/**
	 * Handle the server portion of a client action (if any.)
	 * @throws ActionException
	 */
	public abstract void handle() throws ActionException;
}