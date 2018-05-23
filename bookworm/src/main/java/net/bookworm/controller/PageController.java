package net.bookworm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.backend.dao.BookDAO;
import net.backend.dao.GenreDAO;
import net.backend.dto.Book;
import net.backend.dto.Genre;
import net.bookworm.exception.BookNotFoundException;

@Controller
public class PageController {

	private static final Logger logger = LoggerFactory.getLogger(PageController.class);

	@Autowired
	private GenreDAO genreDAO;

	@Autowired
	private BookDAO bookDAO;

	// Home
	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView index() {
		logger.info("Inside PageController index method - INFO");
		logger.debug("Inside PageController index method - DEBUG");

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

	// Show a single book
	@RequestMapping(value = "/show/{id}/book")
	public ModelAndView showSingleBook(@PathVariable int id) throws BookNotFoundException {
		ModelAndView mv = new ModelAndView("page");

		Book book = bookDAO.get(id);

		if (book == null) {
			throw new BookNotFoundException();
		}

		// Update view count
		book.setViews(book.getViews() + 1);
		bookDAO.update(book);

		mv.addObject("title", book.getName());
		mv.addObject("book", book);
		mv.addObject("userClickShowBook", true);

		return mv;
	}

	// Login
	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam(name = "error", required = false) String error, 
			@RequestParam(name = "logout", required = false) String logout) {
		ModelAndView mv = new ModelAndView("login");
		mv.addObject("title", "Login");

		if (error != null) {
			mv.addObject("message", "Invalid username and password");
		}
		
		if (logout != null) {
			mv.addObject("logout", "Logout successful.");
		}

		return mv;
	}
	
	// Access Denied
	@RequestMapping(value = "/access-denied")
	public ModelAndView accessDenied() {
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("title", "Access Denied");
		mv.addObject("errorTitle", "Aha! Caught you!");
		mv.addObject("errorDescription", "You are not authorized to view this page.");

		return mv;
	}
	
	// Logout
	@RequestMapping(value = "/perform-logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		return "redirect:/login?logout";
	}
}
