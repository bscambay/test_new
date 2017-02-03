/**
 * 
 */
package gov.ssa.gold.reference;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import gov.ssa.gold.support.web.AjaxResponse;

/**
 * @author Chris Vaughan
 *
 */
@Controller
public class ReferenceTypeController 
{
	private static final Logger logger = Logger.getLogger(ReferenceTypeController.class);
	
	@Autowired
	private ReferenceTypeRepository refTypeRepo;

	@RequestMapping(value="referenceTypes")
	public String listReferenceTypes(Model model)
	{
		model.addAttribute("refTypes", this.refTypeRepo.findAll());
		
		return "develop/reference/referenceTypes";
	}
	
	@RequestMapping(value="referenceTypes/new")
	public String newReferenceType(Model model)
	{
		logger.info("Here");
		
		model.addAttribute("readOnly", Boolean.FALSE);
		model.addAttribute("refType", new ReferenceType());
		
		
		
		return "develop/reference/referenceType";
	}
		
	/**
	 * Open the menu in read-only mode
	 * @param refTypeId
	 * @return
	 */
	@RequestMapping(value="referenceTypes/view/{refTypeId}")
	public String viewMenu(@PathVariable("refTypeId") Long refTypeId, Model model)
	{
		model.addAttribute("refType", refTypeRepo.findOne(refTypeId));
		model.addAttribute("readOnly", Boolean.TRUE);
		
		return "develop/reference/referenceType";
	}
	
	/**
	 * Open the menu in edit mode
	 * @param refTypeId
	 * @return
	 */
	@RequestMapping(value="referenceTypes/edit/{refTypeId}")
	public String editMenu(@PathVariable("refTypeId") Long refTypeId, Model model)
	{
		model.addAttribute("refType", refTypeRepo.findOne(refTypeId));
		model.addAttribute("readOnly", Boolean.FALSE);
		
		return "develop/reference/referenceType";
	}
	
	/**
	 * Returns the reference type name for the reference type ID
	 * @param menuId
	 * @return
	 */
	@RequestMapping(value="referenceTypes/name/{refTypeId}", method=RequestMethod.POST)
	public @ResponseBody AjaxResponse getRefTypeName(@PathVariable Long refTypeId)
	{
		String methodName = "Get Reference Type Name";
		
		try
		{
			ReferenceType refType = refTypeRepo.findOne(refTypeId);
			
			if (refType != null)
			{
				AjaxResponse response = new AjaxResponse(methodName);
				
				response.addAttribute("refTypeName", refType.getName());
				
				return response;
			}
			else
			{
				return new AjaxResponse(methodName, String.format("No reference type found with ID %d", refTypeId));
			}
		}
		catch (Exception e)
		{
			logger.error(e);
			return new AjaxResponse(methodName, e.getLocalizedMessage());
		}
	}
}