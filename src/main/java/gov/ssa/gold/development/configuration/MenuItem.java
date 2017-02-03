/**
 * 
 */
package gov.ssa.gold.development.configuration;

import java.io.Serializable;
import java.util.List;

/**
 * Represents a menu item
 * @author Chris Vaughan
 */
public class MenuItem implements Serializable
{
	private static final long serialVersionUID = -3566060857283331462L;
	
	private String id;
	private String text;
	private String icon;
	private List<MenuItem> menuItems;
	
	/**
	 * @return the id
	 */
	public String getId() 
	{
		return id;
	}
	
	/**
	 * @param id the id to set
	 */
	public void setId(String id) 
	{
		this.id = id;
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
	 * @return the icon
	 */
	public String getIcon() 
	{
		return icon;
	}
	
	/**
	 * @param icon the icon to set
	 */
	public void setIcon(String icon) 
	{
		this.icon = icon;
	}
	
	/**
	 * @return the menuItems
	 */
	public List<MenuItem> getMenuItems() 
	{
		return menuItems;
	}
	
	/**
	 * @param menuItems the menuItems to set
	 */
	public void setMenuItems(List<MenuItem> menuItems) 
	{
		this.menuItems = menuItems;
	}
}