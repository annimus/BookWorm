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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.backend.dao.BookDAO;
import net.backend.dao.GenreDAO;
import net.backend.dto.Book;
import net.backend.dto.Genre;
import net.bookworm.util.FileUploadUtility;

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

	// Handling Book Submission
	@RequestMapping(value = "/books", method = RequestMethod.POST)
	public String handleBookSubmission(@Valid @ModelAttribute("book") Book nBook, BindingResult results, Model model, HttpServletRequest request) {
		// Check if there are any errors
		if (results.hasErrors()) {
			model.addAttribute("userClickManageBooks", true);
			model.addAttribute("title", "Manage Books");
			
			return "page";
		}
		
		logger.info(nBook.toString());
		bookDAO.add(nBook);
		
		if (!nBook.getFile().getOriginalFilename().equals("")) {
			FileUploadUtility.uploadFile(request, nBook.getFile(), nBook.getCode());
		}

		return "redirect:/manage/books?operation=book";
	}

	// Returns the list of active genres
	@ModelAttribute("genres")
	public List<Genre> getGenres() {
		return genreDAO.list();
	}
}
