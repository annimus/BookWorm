package net.bookworm.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GloablDefaultExceptionHandler {

	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handlerNoHandlerFoundException() {
		
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("errorTitle", "Page not found!");
		mv.addObject("errorDescription", "Sorry, the page you are trying to reach does not exist!");
		mv.addObject("title", "Page Not Found");
		
		return mv;
	}
	
	@ExceptionHandler(BookNotFoundException.class)
	public ModelAndView handlerBookNotFoundException() {
		
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("errorTitle", "Book not available!");
		mv.addObject("errorDescription", "Sorry, the book you are looking for isn't avaiable right now!");
		mv.addObject("title", "Book Unavailable");
		
		return mv;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handlerException() {
		
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("errorTitle", "Error!");
		mv.addObject("errorDescription", "Something went wrong in our servers. We are working on solving the issue!<br/>Thank you for your patience.");
		mv.addObject("title", "Book Unavailable");
		
		return mv;
	}
}
