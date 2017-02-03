/**
 * 
 */
package gov.ssa.gold.development;

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
 * @author 466115
 *
 */
@Controller
public class PackageController 
{
	private static final Logger logger = Logger.getLogger(PackageController.class);
	
	@Autowired
	private PackageRepository packageRepository;
	
	/**
	 * List all existing packages
	 * @return
	 */
	@RequestMapping(value="packages")
	public String listPackages(Model model)
	{
		model.addAttribute("packages", packageRepository.findAll());
		
		return "develop/package/list";
	}
	
	/**
	 * Send user to new package page
	 * @param model
	 * @return
	 */
	@RequestMapping(value="packages/new")
	public String newPackage(Model model)
	{
		model.addAttribute("_package", new Package());
		model.addAttribute("readOnly", Boolean.FALSE);
		
		return "develop/package/edit";
	}
	
	/**
	 * Open the package in read-only mode
	 * @param packageId
	 * @return
	 */
	@RequestMapping(value="packages/view/{packageId}")
	public String viewPackage(@PathVariable("packageId") Long packageId, Model model)
	{
		model.addAttribute("_package", packageRepository.findOne(packageId));
		model.addAttribute("readOnly", Boolean.TRUE);
		
		return "develop/package/edit";
	}
	
	/**
	 * Open the package in edit mode
	 * @param packageId
	 * @return
	 */
	@RequestMapping(value="packages/edit/{packageId}")
	public String editPackage(@PathVariable("packageId") Long packageId, Model model)
	{
		model.addAttribute("_package", packageRepository.findOne(packageId));
		model.addAttribute("readOnly", Boolean.FALSE);
		
		return "develop/package/edit";
	}
	
	/**
	 * Create a copy of the specified package and open it for editing
	 * @param packageId
	 * @param model
	 * @param principal
	 * @return
	 */
	@RequestMapping(value="packages/copy/{packageId}")
	public String copyPackage(@PathVariable("packageId") Long packageId, Model model, Principal principal)
	{
		Package _package = packageRepository.findOne(packageId);
		Package copyPackage = new Package();
		
		copyPackage.setName("Copy of " + _package.getName());
		copyPackage.setDescription(_package.getDescription());
		copyPackage.setCreatedBy(principal.getName());
		copyPackage.setLastModifiedBy(principal.getName());
		copyPackage.setCreated(new Timestamp(System.currentTimeMillis()));
		copyPackage.setLastModified(new Timestamp(System.currentTimeMillis()));
				
		packageRepository.save(copyPackage);
		
		model.addAttribute("readOnly", Boolean.FALSE);
		model.addAttribute("_package", copyPackage);
		
		return "develop/package/edit";
	}
	
	/**
	 * Returns the package name for the package ID
	 * @param packageId
	 * @return
	 */
	@RequestMapping(value="packages/name/{packageId}", method=RequestMethod.POST)
	public @ResponseBody AjaxResponse getPackageName(@PathVariable Long packageId)
	{
		String methodName = "Get Package Name";
		
		try
		{
			Package _package = packageRepository.findOne(packageId);
			
			if (_package != null)
			{
				AjaxResponse response = new AjaxResponse(methodName);
				
				response.addAttribute("packageName", _package.getName());
				
				return response;
			}
			else
			{
				return new AjaxResponse(methodName, String.format("No package found with ID %d", packageId));
			}
		}
		catch (Exception e)
		{
			logger.error(e);
			return new AjaxResponse(methodName, e.getLocalizedMessage());
		}
	}
	
	/**
	 * Save the package from the client
	 * @param _package
	 * @return
	 */
	@RequestMapping(value="packages/save", method=RequestMethod.POST)
	public @ResponseBody AjaxResponse savePackage(Principal principal, @RequestBody Package _package)
	{
		Package packageToSave = _package;
		
		if (_package.getId() == null)
		{
			_package.setCreatedBy(principal.getName());
			_package.setCreated(new Timestamp(System.currentTimeMillis()));
		}
		else
		{
			packageToSave = packageRepository.findOne(_package.getId());
			
			packageToSave.setName(_package.getName());
			packageToSave.setDescription(_package.getDescription());
		}
		
		packageToSave.setLastModifiedBy(principal.getName());
		packageToSave.setLastModified(new Timestamp(System.currentTimeMillis()));
			
		try
		{
			packageRepository.save(packageToSave);

			return new AjaxResponse("Save Package");
		}
		catch (Exception ex)
		{
			ex.printStackTrace();

			return new AjaxResponse("Save Package", ex.getLocalizedMessage());
		}	
	}
	
	/**
	 * Delete the package
	 * @param packageId
	 * @return
	 */
	@RequestMapping(value="packages/delete/{packageId}", method=RequestMethod.POST)
	public @ResponseBody AjaxResponse deletePackage(@PathVariable("packageId") Long packageId)
	{
		try
		{
			Package _package = packageRepository.findOne(packageId);
			
			packageRepository.delete(_package);
			
			return new AjaxResponse("Delete Package");
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return new AjaxResponse("Delete package", e.getLocalizedMessage());
		}
	}
}