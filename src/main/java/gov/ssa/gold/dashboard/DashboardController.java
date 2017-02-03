/**
 * 
 */
package gov.ssa.gold.dashboard;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



/**
 * Controller for managing Dashboards
 * @author Michael Clair
 */
@Controller
public class DashboardController 
{
	
	/**
	 * Handle request to view all Dashboards
	 * @param model
	 * @return
	 */

	@RequestMapping(value = "dashboard")
	public String Dashboard() {
        return "dashboard/dashboard";
    }
	
	
	@RequestMapping(value = "searchResult")
	public String SearchResult() {
        return "dashboard/searchResult";
    }
	
	
	
}