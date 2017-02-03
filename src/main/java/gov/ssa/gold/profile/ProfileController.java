package gov.ssa.gold.profile;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import gov.ssa.gold.account.Account;
import gov.ssa.gold.account.AccountRepository;
import gov.ssa.gold.account.Name;

@Controller
public class ProfileController {
	
	@Autowired
	private AccountRepository actRep;
	
	@RequestMapping(value = "/profile")
	public String myProfile(Principal principal, Model model) {
		Account userLoggedIn = actRep.findByPin(principal.getName());
		Name nameObj = new Name(userLoggedIn.getName());
		System.out.println(userLoggedIn.toString());
		model.addAttribute("user", userLoggedIn);
		model.addAttribute("nameObj", nameObj);
		if (userLoggedIn.getShortEmail() != null){	
			model.addAttribute("shortEmail", userLoggedIn.getShortEmail());
		}
		
        return "profile/profile";
    }
	
	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public String editProfile(@ModelAttribute("profileForm") EditProfileForm editProfileForm, Principal principal) {
		actRep.update(principal.getName(), editProfileForm);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/edit_profile")
	public String showForm(Principal principal, Model model) {
		Account userLoggedIn = actRep.findByPin(principal.getName());
		Name nameObj = new Name(userLoggedIn.getName());
		System.out.println(userLoggedIn.toString());
		model.addAttribute("user", userLoggedIn);
		model.addAttribute("nameObj", nameObj);
		if (userLoggedIn.getShortEmail() != null){	
			model.addAttribute("shortEmail", userLoggedIn.getShortEmail());
		}
		EditProfileForm profileForm = new EditProfileForm();
		model.addAttribute("profileForm", profileForm);
		
		
		return "profile/edit_profile";
	}
}