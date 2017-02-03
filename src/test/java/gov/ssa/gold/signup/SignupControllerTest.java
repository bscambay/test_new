package gov.ssa.gold.signup;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Test;

import gov.ssa.gold.config.WebAppConfigurationAware;

public class SignupControllerTest extends WebAppConfigurationAware {
    
	@Test
    public void displaysSignupForm() throws Exception {
        mockMvc.perform(get("/signup"))
                .andExpect(model().attributeExists("userForm"))
                .andExpect(view().name("signup/signup"));
    }
}