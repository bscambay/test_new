package gov.ssa.gold.workflow;


import java.security.Principal;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Controller for managing workflows
 
 */
@Controller
@Transactional
public class WorkflowController 
{
	@Autowired
	private WorkflowRepository workflowRepository;
	
	/**
	 * Handle request to view all workflows
	 * @param model
	 * @return
	 */
	@RequestMapping(value="workflows")
	public String getWorkflows(Model model)
	{
		model.addAttribute("workflows", workflowRepository.findAll());
	
		return "workflow/workflows";
	}
	
	/**
	 * Handle request to get new workflow form
	 * @return
	 */
	@RequestMapping(value="/workflow")
	public String getNewWorkflow()
	{
		return "workflow/new";
	}
	
	/**
	 * Handle new workflow post event
	 * @param workflow
	 * @return
	 */
	@RequestMapping(value="workflows/saveNew", method=RequestMethod.POST)
	public @ResponseBody String saveNewWorkflow(Principal principal, @RequestBody Workflow workflow)
	{
		
		workflow.setCreatedBy(principal.getName());
		workflow.setLastModifiedBy(principal.getName());
		workflow.setCreated(new Timestamp(System.currentTimeMillis()));
		workflow.setLastModified(new Timestamp(System.currentTimeMillis()));
		
		try
		{
			workflowRepository.save(workflow);
			return "{\"result\": \"success\"}";
		}
		catch (Exception ex)
		{
			System.out.println("error");
			return "Error";
		}
	}
	
	/**
	 * Handle delete workflow post event
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/workflows/{id}/delete", method = RequestMethod.POST)
	public String deleteWorkflow(@PathVariable("id") long id) {
		System.out.println("Attempting to delete workflow #" + id);
		Workflow workflow = workflowRepository.getOne(id);
		workflowRepository.delete(workflow);

		return "redirect:/#/workflows";

		}
}