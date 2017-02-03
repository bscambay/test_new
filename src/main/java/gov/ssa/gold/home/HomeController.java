package gov.ssa.gold.home;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gov.ssa.gold.account.Account;
import gov.ssa.gold.account.AccountRepository;
import gov.ssa.gold.account.Name;
import gov.ssa.gold.preference.Preference;
import gov.ssa.gold.preference.PreferenceRepository;

@Controller
public class HomeController 
{
	@Autowired
	private AccountRepository actRep;
	
	@Autowired
	private PreferenceRepository preferenceRepo;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Principal principal, Model model, @RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		
		if (principal != null)
		{
			Account act = actRep.findByPin(principal.getName());
			Name nameObj = new Name(act.getName());
			model.addAttribute("username", nameObj.getFirstName() + " " + nameObj.getLastName());
			
			Preference pref = preferenceRepo.findByAccountPin(principal.getName());
			
			String themeColor = "default";
			
			if (pref != null && !StringUtils.isEmpty(pref.getThemeColor()))
			{
				themeColor = pref.getThemeColor();
			}
			
			model.addAttribute("themeColor", themeColor);
			
			return "index";
		} 
		else 
		{
			if (error != null) {
				model.addAttribute("error", "Invalid username or password!");
			}

			if (logout != null) {
				model.addAttribute("msg", "You've been logged out successfully.");
			}
			return "home/homeNotSignedIn";
		}
	}
}
