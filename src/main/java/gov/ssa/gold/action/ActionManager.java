/**
 * 
 */
package gov.ssa.gold.action;

import java.util.ArrayList;
import java.util.List;

/**
 * This class manages actions
 * 
 * @author Chris Vaughan
 *
 */
public class ActionManager 
{
	private static final List<Action> actions;
	
	static
	{
		// TODO Modify to use class loaders
		actions = new ArrayList<Action>();
		
		actions.add(new LoggingAction());
	}
	
	/**
	 * Return the set of valid actions
	 * @return
	 */
	public List<Action> getActions()
	{
		return actions;
	}
}