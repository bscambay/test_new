package gov.ssa.gold.account;

import java.security.Principal;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
// import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
// @Secured("ROLE_USER")
public class AccountController 
{
	private static final Logger logger = LogManager.getLogger(AccountController.class);

    private AccountRepository accountRepository;

    @Autowired
    public AccountController(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    @RequestMapping(value = "account/current", method = RequestMethod.GET)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public Account accounts(Principal principal) {
        Assert.notNull(principal);
       System.out.println(principal.getName());
        return accountRepository.findByPin(principal.getName());
    }
    
    /**
     * Retrieve the list of accounts
     * @return
     */
    @RequestMapping(value="accounts", method=RequestMethod.GET)
    public String getAccounts(Model model) 
    {
    	logger.debug("In AccountController::getAccounts");
    	
    	List<Account> accounts = this.accountRepository.findAll();
    	
    	model.addAttribute("accounts", accounts);
    	
    	return "admin/accounts";
    }
}