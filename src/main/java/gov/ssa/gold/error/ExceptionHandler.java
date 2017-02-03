package gov.ssa.gold.error;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.base.Throwables;

/**
 * General error handler for the application.
 */
@ControllerAdvice
class ExceptionHandler {

	/**
	 * Handle exceptions thrown by handlers.
	 */
	@org.springframework.web.bind.annotation.ExceptionHandler(value = Exception.class)	
	public ModelAndView exception(Exception exception, WebRequest request) {
		ModelAndView modelAndView = new ModelAndView("error/general");
		
		String exceptionMessage = null;
		CharSequence dupe = "duplicate";
		if (Throwables.getRootCause(exception).toString().contains(dupe)) {
			exceptionMessage = "An account with the corresponding PIN already exists.<br/>"
					+ "Please try again with your assigned PIN";
		} else {
			exceptionMessage = "We apologize, something went wrong.<br/>"
					+ "Thank you for your patience as we work to correct the issue.<br/>" 
					+ "Please try your request later.";
		}
		
		modelAndView.addObject("errorMessage", exceptionMessage);
		modelAndView.addObject("errorCodeZero", "5");
		modelAndView.addObject("errorCodeOne", "0");
		modelAndView.addObject("errorCodeTwo", "0");
		return modelAndView;
	}
}