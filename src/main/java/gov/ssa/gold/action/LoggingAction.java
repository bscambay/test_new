/**
 * 
 */
package gov.ssa.gold.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.log4j.Priority;

/**
 * Logging action
 * @author Chris Vaughan
 */
public class LoggingAction extends ServerAction 
{
	private static final Logger logger = Logger.getLogger(LoggingAction.class);
	private static final List<ActionArgumentDefinition<?>> actionArguments;
	
	static
	{
		actionArguments = new ArrayList<ActionArgumentDefinition<?>>();
		
		actionArguments.add(new ActionArgumentDefinition<Priority>("Priority", Boolean.TRUE, Priority.class));
		actionArguments.add(new ActionArgumentDefinition<String>("Message", Boolean.TRUE, String.class));
	}
	
	/**
	 * Constructor
	 */
	public LoggingAction() 
	{
		super("Logging Action", new ArrayList<ActionArgumentDefinition<?>>());
	}

	/* (non-Javadoc)
	 * @see gov.ssa.gold.action.ServerAction#execute(java.util.Map)
	 */
	@Override
	public void execute(Map<String, ?> arguments) throws ActionException 
	{
		this.validateArguments(arguments);
		
		Priority priority = (Priority) arguments.get("Priority");
		String message = (String) arguments.get("Message");
					
		logger.log(priority, message);
	}
}