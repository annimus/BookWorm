package net.bookworm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.backend.dao.GenreDAO;
import net.backend.dto.Genre;

@Controller
public class PageController {

	@Autowired
	private GenreDAO genreDAO;

	// Home
	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("page");

		mv.addObject("title", "Home");
		mv.addObject("userClickHome", true);
		mv.addObject("genres", genreDAO.list());

		return mv;
	}

	// About Us
	@RequestMapping(value = { "/about" })
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page");

		mv.addObject("title", "About Us!");
		mv.addObject("userClickAbout", true);

		return mv;
	}

	// Contact Us
	@RequestMapping(value = { "/contact" })
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView("page");

		mv.addObject("title", "Contact Us!");
		mv.addObject("userClickContact", true);

		return mv;
	}

	// Show all books
	@RequestMapping(value = "/show/all/books")
	public ModelAndView showAllBooks() {
		ModelAndView mv = new ModelAndView("page");

		mv.addObject("title", "All Books");
		mv.addObject("userClickAllBooks", true);
		mv.addObject("genres", genreDAO.list());

		return mv;
	}

	// Show all books from a genre
	@RequestMapping(value = "/show/genre/{id}/books")
	public ModelAndView showGenreBooks(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("page");
		Genre genre = genreDAO.get(id);
		
		mv.addObject("title", genre.getName());
		mv.addObject("userClickGenreBooks", true);
		mv.addObject("genres", genreDAO.list());
		mv.addObject("genre", genre);

		return mv;
	}

}
