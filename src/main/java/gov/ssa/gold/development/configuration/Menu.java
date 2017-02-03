package gov.ssa.gold.development.configuration;

import java.io.Serializable;
import java.util.List;

public class Menu implements Serializable
{
	private static final long serialVersionUID = -50079972841283661L;
	
	private List<MenuItem> menuItems;

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