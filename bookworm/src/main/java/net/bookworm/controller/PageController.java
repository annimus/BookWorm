package net.bookworm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.backend.dao.GenreDAO;

@Controller
public class PageController {

	@Autowired
	private GenreDAO genreDAO;
	
	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("page");

		mv.addObject("title", "Home");
		mv.addObject("userClickHome", true);
		mv.addObject("genres", genreDAO.list());
		
		return mv;
	}
	
	@RequestMapping(value = { "/about"})
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page");

		mv.addObject("title", "About Us!");
		mv.addObject("userClickAbout", true);
		
		return mv;
	}
	
	@RequestMapping(value = { "/contact"})
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView("page");

		mv.addObject("title", "Contact Us!");
		mv.addObject("userClickContact", true);
		
		return mv;
	}

}
