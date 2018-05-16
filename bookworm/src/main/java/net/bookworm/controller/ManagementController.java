package net.bookworm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.backend.dao.BookDAO;
import net.backend.dao.GenreDAO;
import net.backend.dto.Book;
import net.backend.dto.Genre;
import net.bookworm.util.FileUploadUtility;
import net.bookworm.validator.BookValidator;

@Controller
@RequestMapping("/manage")
public class ManagementController {

	@Autowired
	private GenreDAO genreDAO;

	@Autowired
	private BookDAO bookDAO;

	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);

	@RequestMapping(value = "/books", method = RequestMethod.GET)
	public ModelAndView showManageBooks(@RequestParam(name = "operation", required = false) String operation) {
		ModelAndView mv = new ModelAndView("page");

		mv.addObject("userClickManageBooks", true);
		mv.addObject("title", "Manage Books");

		Book nBook = new Book();
		nBook.setSupplierId(2);
		nBook.setActive(true);

		mv.addObject("book", nBook);

		if (operation != null) {
			if (operation.equals("book")) {
				mv.addObject("message", "Book Submitted Successfully!");
			}
		}

		return mv;
	}
	
	@RequestMapping(value = "/{id}/book", method = RequestMethod.GET)
	public ModelAndView showEditBook(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("page");

		mv.addObject("userClickManageBooks", true);
		mv.addObject("title", "Manage Books");
		
		Book book = bookDAO.get(id);

		mv.addObject("book", book);

		return mv;
	}

	// Handling Book Submission
	@RequestMapping(value = "/books", method = RequestMethod.POST)
	public String handleBookSubmission(@Valid @ModelAttribute("book") Book nBook, BindingResult results, Model model, HttpServletRequest request) {
		
		if (nBook.getId() == 0) {
			new BookValidator().validate(nBook, results);
		} else if (!nBook.getFile().getOriginalFilename().equals("")) {
			new BookValidator().validate(nBook, results);
		}
		
		// Check if there are any errors
		if (results.hasErrors()) {
			model.addAttribute("userClickManageBooks", true);
			model.addAttribute("title", "Manage Books");
			
			return "page";
		}
		
		logger.info(nBook.toString());
		
		// Checks if it's a new book or a edited book
		if (nBook.getId() == 0) {
			bookDAO.add(nBook);
		} else {
			bookDAO.update(nBook);
		}
		
		if (!nBook.getFile().getOriginalFilename().equals("")) {
			FileUploadUtility.uploadFile(request, nBook.getFile(), nBook.getCode());
		}

		return "redirect:/manage/books?operation=book";
	}
	
	@RequestMapping(value = "/book/{id}/activation", method = RequestMethod.POST)
	@ResponseBody
	public String hadleBookActivation(@PathVariable int id) {
		Book book  = bookDAO.get(id);
		boolean isActive = book.isActive();
		
		book.setActive(!book.isActive());
		
		bookDAO.update(book);
		
		return (isActive)? book.getName() + " has been deactivated." : book.getName() + " has been activated.";
	}
	

	// Returns the list of active genres
	@ModelAttribute("genres")
	public List<Genre> getGenres() {
		return genreDAO.list();
	}
}
