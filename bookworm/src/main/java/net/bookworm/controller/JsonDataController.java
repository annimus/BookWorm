package net.bookworm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.backend.dao.BookDAO;
import net.backend.dao.BookReviewDAO;
import net.backend.dto.Book;
import net.backend.dto.BookReview;

@Controller
@RequestMapping("/json/data")
public class JsonDataController {

	@Autowired
	private BookDAO bookDAO;
	
	@Autowired
	private BookReviewDAO bookReviewDAO;
	
	@RequestMapping("/all/books")
	@ResponseBody
	public List<Book> getAllBooks() {
		return bookDAO.listActiveBooks();
	}
	
	@RequestMapping("/admin/all/books")
	@ResponseBody
	public List<Book> getAllBooksForAdmin() {
		return bookDAO.list();
	}
	
	@RequestMapping("/genre/{id}/books")
	@ResponseBody
	public List<Book> getAllBooksByGenre(@PathVariable int id) {
		return bookDAO.listActiveBooksByGenre(id);
	}
	
	@RequestMapping("/book/{id}/reviews")
	@ResponseBody
	public List<BookReview> getBookReview(@PathVariable int id) {
		return bookReviewDAO.listByBook(id);
	}
}
