package net.bookworm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.backend.dao.BookDAO;
import net.backend.dto.Book;

@Controller
@RequestMapping("/json/data")
public class JsonDataController {

	@Autowired
	private BookDAO bookDAO;
	
	@RequestMapping("/all/books")
	@ResponseBody
	public List<Book> getAllBooks() {
		return bookDAO.listActiveBooks();
	}
	
	@RequestMapping("/genre/{id}/books")
	@ResponseBody
	public List<Book> getAllBooksByGenre(@PathVariable int id) {
		return bookDAO.listActiveBooksByGenre(id);
	}
}
