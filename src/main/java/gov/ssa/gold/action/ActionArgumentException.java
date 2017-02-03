/**
 * 
 */
package gov.ssa.gold.action;

/**
 * @author Chris Vaughan
 *
 */
public class ActionArgumentException extends Exception 
{
	private static final long serialVersionUID = -4011309298630701427L;
	
	public ActionArgumentException(String argumentName, String issue)
	{
		super(String.format("Argument %s is invalid: %s", argumentName, issue));
	}	
}