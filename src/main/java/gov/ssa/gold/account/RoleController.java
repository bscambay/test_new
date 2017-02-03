/**
 * 
 */
package gov.ssa.gold.account;

import java.util.Dictionary;
import java.util.Hashtable;
import java.util.List;

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
 * Controller for managing roles
 * 
 * @author Chris Vaughan
 */
@Controller
public class RoleController {
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private AccountRepository accountRepository; 
	
	@Autowired
	private AccountRoleRepository accountRoleRepository;
	
	/**
	 * Handle request to view all roles
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "roles")
	public String getRoles(Model model) {
		// TODO Make more efficient
		List<Role> roles = roleRepository.findAll();

		model.addAttribute("roles", roles);
		
		return "roles/roles";

	}

	/**
	 * Handle request to get new role form
	 * 
	 * @return
	 */
	@RequestMapping(value = "roles/new")
	public String getNewRole() {
		return "roles/newRole";
	}
	
	/**
	 * Handle request to get new account role
	 * 
	 * @return
	 * 
	 */
//	@RequestMapping(value = "roles/newAccountRole")
//	public String getNewAccountRole(){
//		System.out.println("Stuff");
//		return "roles/newAccountRole";
//	}

	/**
	 * Handle new role post event
	 * 
	 * @param role
	 * @return
	 */
	@RequestMapping(value = "roles/saveNew", method = RequestMethod.POST)
	public @ResponseBody String saveNewRole(@RequestBody Role role) {
		try {
			roleRepository.save(role);

			return "{\"result\": \"success\"}";
		} catch (Exception ex) {
			return "Error";
		}
	}

	/**
	 * Handle delete role post event
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/roles/delete/{id}", method = RequestMethod.POST)
	public @ResponseBody AjaxResponse deleteRole(@PathVariable("id") long id) {
		System.out.println("Attempting to delete role #" + id);
		
		Role role = roleRepository.getOne(id);
		roleRepository.delete(role);

		return new AjaxResponse("Delete Role");

	}
	
	@RequestMapping(value = "roles/newAccountRole/{roleId}", method = RequestMethod.GET)
	public String getAccounts(@PathVariable("roleId") Long roleId, Model model) {
		System.out.println("Role ID is: " + roleId);
		List<Account> accounts = accountRepository.findAll();
		
		Dictionary<Long, String> allAccounts = new Hashtable<>();
		
		model.addAttribute("accounts", accounts);
		model.addAttribute("allAccounts", allAccounts);
		
		System.out.println("Finding stuff");
		return "roles/newAccountRole";
	}
	
	//TODO Add validation
	//TODO Error handling
	//TODO Add audit fields
	@RequestMapping(value="", method = RequestMethod.POST)
	public @ResponseBody AjaxResponse addRoleToAccount(String accountPin, Long roleId){
		AccountRole accountRole = new AccountRole();
		
		accountRole.setAccountPin(accountPin);
		accountRole.setRoleId(roleId);
		
		accountRoleRepository.save(accountRole);
		
		return new AjaxResponse("Add Role to Account"); 
	}
	
}