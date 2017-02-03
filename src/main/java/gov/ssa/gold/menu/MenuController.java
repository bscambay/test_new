/**
 * 
 */
package gov.ssa.gold.menu;

import java.security.Principal;
import java.sql.Timestamp;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import gov.ssa.gold.support.web.AjaxResponse;

/**
 * 
 * @author Chris Vaughan
 */
@Controller
public class MenuController 
{
	private static final Logger logger = Logger.getLogger(MenuController.class);
	
	@Autowired
	private MenuRepository menuRepository;
	
	/**
	 * Return the menu list template
	 * @return
	 */
	@RequestMapping(value="menus", method=RequestMethod.GET)
	public String getMenus(Model model)
	{
		model.addAttribute("menus", menuRepository.findAll());
		
		return "develop/menu/list";
	}
	
	/**
	 * Send user to new menu page
	 * @param model
	 * @return
	 */
	@RequestMapping(value="menus/new")
	public String newMenu(Model model)
	{
		model.addAttribute("menu", new Menu());
		model.addAttribute("readOnly", Boolean.FALSE);
		
		return "develop/menu/edit";
	}
	
	/**
	 * Open the menu in read-only mode
	 * @param menuId
	 * @return
	 */
	@RequestMapping(value="menus/view/{menuId}")
	public String viewMenu(@PathVariable("menuId") Long menuId, Model model)
	{
		model.addAttribute("menu", menuRepository.findOne(menuId));
		model.addAttribute("readOnly", Boolean.TRUE);
		
		return "develop/menu/edit";
	}
	
	/**
	 * Open the menu in edit mode
	 * @param menuId
	 * @return
	 */
	@RequestMapping(value="menus/edit/{menuId}")
	public String editMenu(@PathVariable("menuId") Long menuId, Model model)
	{
		model.addAttribute("menu", menuRepository.findOne(menuId));
		model.addAttribute("readOnly", Boolean.FALSE);
		
		return "develop/menu/edit";
	}
	
	/**
	 * Create a copy of the specified menu and open it for editing
	 * @param menuId
	 * @param model
	 * @param principal
	 * @return
	 */
	@RequestMapping(value="menus/copy/{menuId}")
	public String copyMenu(@PathVariable("menuId") Long menuId, Model model, Principal principal)
	{
		Menu menu = menuRepository.findOne(menuId);
		Menu copyMenu = new Menu();
		
		copyMenu.setName("Copy of " + menu.getName());
		copyMenu.setDescription(menu.getDescription());
		copyMenu.setCreatedBy(principal.getName());
		copyMenu.setLastModifiedBy(principal.getName());
		copyMenu.setCreated(new Timestamp(System.currentTimeMillis()));
		copyMenu.setLastModified(new Timestamp(System.currentTimeMillis()));
				
		menuRepository.save(copyMenu);
		
		model.addAttribute("readOnly", Boolean.FALSE);
		model.addAttribute("menu", copyMenu);
		
		return "develop/menu/edit";
	}
	
	/**
	 * Returns the menu name for the menu ID
	 * @param menuId
	 * @return
	 */
	@RequestMapping(value="menus/name/{menuId}", method=RequestMethod.POST)
	public @ResponseBody AjaxResponse getMenuName(@PathVariable Long menuId)
	{
		String methodName = "Get Menu Name";
		
		try
		{
			Menu menu = menuRepository.findOne(menuId);
			
			if (menu != null)
			{
				AjaxResponse response = new AjaxResponse(methodName);
				
				response.addAttribute("menuName", menu.getName());
				
				return response;
			}
			else
			{
				return new AjaxResponse(methodName, String.format("No menu found with ID %d", menuId));
			}
		}
		catch (Exception e)
		{
			logger.error(e);
			return new AjaxResponse(methodName, e.getLocalizedMessage());
		}
	}
	
	/**
	 * Save the menu from the client
	 * @param menu
	 * @return
	 */
	@RequestMapping(value="menus/save", method=RequestMethod.POST)
	public @ResponseBody AjaxResponse saveMenu(Principal principal, @RequestBody Menu menu)
	{
		Menu menuToSave = menu;
		String methodName = "Save Menu";
		
		if (menu.getId() == null)
		{
			menu.setCreatedBy(principal.getName());
			menu.setCreated(new Timestamp(System.currentTimeMillis()));
		}
		else
		{
			menuToSave = menuRepository.findOne(menu.getId());
			
			menuToSave.setName(menu.getName());
			menuToSave.setDescription(menu.getDescription());
		}
		
		menuToSave.setLastModifiedBy(principal.getName());
		menuToSave.setLastModified(new Timestamp(System.currentTimeMillis()));
			
		try
		{
			menuRepository.save(menuToSave);

			return new AjaxResponse(methodName);
		}
		catch (Exception ex)
		{
			logger.error(ex);
			return new AjaxResponse(methodName, ex.getLocalizedMessage());
		}
	}
	
	/**
	 * Delete the menu
	 * @param menuId
	 * @return
	 */
	@RequestMapping(value="menus/delete/{menuId}", method=RequestMethod.POST)
	public @ResponseBody AjaxResponse deleteMenu(@PathVariable("menuId") Long menuId)
	{
		String methodName = "Delete Menu";
		
		try
		{
			Menu menu = menuRepository.findOne(menuId);
			
			menuRepository.delete(menu);
			
			return new AjaxResponse(methodName);
		}
		catch (Exception e)
		{
			logger.error(e);
			return new AjaxResponse(methodName, e.getLocalizedMessage());
		}
	}
}