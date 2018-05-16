package net.bookworm.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.backend.dao.BookDAO;
import net.backend.dao.GenreDAO;
import net.backend.dto.Book;
import net.backend.dto.Genre;

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
    public String handleBookSubmission(@ModelAttribute("book") Book nBook) {
	logger.info(nBook.toString());
	bookDAO.add(nBook);

	return "redirect:/manage/books?operation=book";
    }

    // Returns the list of active genres
    @ModelAttribute("genres")
    public List<Genre> getGenres() {
	return genreDAO.list();
    }
}
