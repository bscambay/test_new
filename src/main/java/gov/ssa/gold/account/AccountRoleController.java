/**
 * 
 */

package gov.ssa.gold.account;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 
 * @author Jonathan Pack
 *
 */

@Controller
public class AccountRoleController {
	
	@Autowired
	private AccountRoleRepository accountRoleRepository;
	
	/** 
	 * Handle request to view all account roles
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "accountRoles")
	public String getAccountRoles(Model model) {
		List<AccountRole> accountRoles = accountRoleRepository.findAll();
		
		// TODO Add functionality for getting account roles
		
		model.addAttribute("accountRoles", accountRoles);
		
		return "roles/accountRoles";
			
	}
	/**
	 * 
	 * Handle adding of account to role
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/accountroles/{id}/", method = RequestMethod.POST)
	public String addAccountRole(@PathVariable("id") long id) {
		return "redirect:/#roles";
	}
	
	/**
	 * 
	 * Handle adding of account to role
	 * 
	 * @param id
	 * @return
	 */
	
	
}
