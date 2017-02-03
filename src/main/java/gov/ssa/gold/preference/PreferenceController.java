/**
 * 
 */
package gov.ssa.gold.preference;

import java.security.Principal;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import gov.ssa.gold.account.Account;
import gov.ssa.gold.account.AccountRepository;
import gov.ssa.gold.support.web.AjaxResponse;


/**
 * Controller for managing preferences
 * @author Michael Clair
 */
@Controller
public class PreferenceController 
{
	private static final Logger logger = Logger.getLogger(PreferenceController.class);
	
	@Autowired
	private PreferenceRepository preferenceRepository;
	
	@Autowired
	private AccountRepository actRep;
	
	
	/**
	 * Handle request to view preference by principal
	 * @param model
	 * @return
	 */
	@RequestMapping(value="preferences")
	public String getPreferences(Principal principal, Model model)
	{
		model.addAttribute("preferences", preferenceRepository.findByAccountPin(principal.getName()));
		Account act = actRep.findByPin(principal.getName());
		model.addAttribute("username", act.getName());
		return "preference/preferences";
	}
	
	@RequestMapping(value = "preference")
	public String preference() {
        return "preference/preference";
    }
	
	/**
	 * Save preferences
	 * @param preference
	 * @param principal
	 * @return
	 */
	@RequestMapping(value="preferences/save", method=RequestMethod.POST)
	public @ResponseBody AjaxResponse save(@RequestBody Preference preference, Principal principal)
	{
		String methodName = "Save Preferences";
		
		try
		{
			Preference preferenceToSave = preferenceRepository.findByAccountPin(principal.getName());
			
			if (preferenceToSave != null)
			{
				// TODO Modify to ignore null properties in source
				// BeanUtils.copyProperties(preference, preferenceToSave);
				// For now - only sets theme color
				preferenceToSave.setThemeColor(preference.getThemeColor());
			}
			else
			{
				preferenceToSave = preference;
			}
			
			if (StringUtils.isEmpty(preferenceToSave.getAccountPin()))
			{
				preferenceToSave.setAccountPin(principal.getName());
			}
			else if (!preferenceToSave.getAccountPin().equals(principal.getName()))
			{
				logger.error("Attempt to update preferences for account other than the principal");
				throw new SecurityException();
			}
			
			preferenceRepository.save(preferenceToSave);
			
			return new AjaxResponse(methodName);
		}
		catch (Exception e)
		{
			logger.error(e);
			return new AjaxResponse(methodName, e.getLocalizedMessage());
		}
	}	
	
	/**
	 * Handle request to get new preference form
	 * @return
	 */
	@RequestMapping(value="preferences/new")
	public String getNewPreference()
	{
		return "preferences/preferences";
	}
	
	/**
	 * Handle new preference post event
	 * @param preference
	 * @return
	 */
	@RequestMapping(value="preferences/saveNew", method=RequestMethod.POST)
	public @ResponseBody String saveNewPreference(@RequestBody Preference preference)
	{
		try
		{

			Preference apref = preferenceRepository.findByAccountPin(preference.getAccountPin());
			if (apref != null) {
				preference.setPreferenceId(apref.getPreferenceId());
				if (apref.getThemeColor() != null) {
					preference.setThemeColor(apref.getThemeColor());
				}
			}
			
			System.out.println("In save new pref" + preference);
			preferenceRepository.save(preference);
			return "{\"result\": \"success\"}";
		}
		catch (Exception ex)
		{
			return "Error";
		}
	}
	
	/**
	 * Handle delete role post event
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/preferences/{id}/delete", method = RequestMethod.POST)
	public String deletePreference(@PathVariable("id") long id) {
		System.out.println("Attempting to delete preference #" + id);
		Preference preference = preferenceRepository.getOne(id);
		preferenceRepository.delete(preference);

		return "redirect:/#/preferences";

	}
}