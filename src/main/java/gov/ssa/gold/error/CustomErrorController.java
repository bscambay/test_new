package gov.ssa.gold.error;

import java.text.MessageFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.common.base.Throwables;

@Controller
class CustomErrorController {
	
	/**
	 * Display an error page, as defined in web.xml <code>custom-error</code> element.
	 */
	@RequestMapping("generalError")	
	public String generalError(HttpServletRequest request, HttpServletResponse response, Model model) {
		// retrieve some useful information from the request
		Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
		String codeAsString = String.valueOf(statusCode);
		Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
		// String servletName = (String) request.getAttribute("javax.servlet.error.servlet_name");
		String exceptionMessage = getExceptionMessage(throwable, statusCode);
		String requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");
		
		if (requestUri == null) {
			requestUri = "Unknown";
		}
		
		String message = MessageFormat.format("{0}", exceptionMessage); 
		String codePositionZero = MessageFormat.format("{0}", codeAsString.charAt(0));
		String codePositionOne = MessageFormat.format("{0}", codeAsString.charAt(1));
		String codePositionTwo = MessageFormat.format("{0}", codeAsString.charAt(2));
		
		model.addAttribute("errorCodeZero", codePositionZero);
		model.addAttribute("errorCodeOne", codePositionOne);
		model.addAttribute("errorCodeTwo", codePositionTwo);
		model.addAttribute("errorMessage", message);
        return "error/general";
	}

	private String getExceptionMessage(Throwable throwable, Integer statusCode) {
		if (throwable != null) {
			return Throwables.getRootCause(throwable).getMessage();
		}
		HttpStatus httpStatus = HttpStatus.valueOf(statusCode);
		return httpStatus.getReasonPhrase();
	}
}
