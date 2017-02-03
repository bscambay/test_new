/**
 * 
 */
package gov.ssa.gold.action;

/**
 * 
 * @author Chris Vaughan
 *
 */
public class ActionException extends Exception 
{
	private static final long serialVersionUID = -571319249571354306L;
	
	public ActionException(String description)
	{
		super(description);
	}
	
	public ActionException(Throwable cause)
	{
		super(cause);
	}
	
	public ActionException(String description, Throwable cause)
	{
		super(description, cause);
	}
}