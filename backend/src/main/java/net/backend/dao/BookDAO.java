package net.backend.dao;

import java.util.List;

import net.backend.dto.Book;

public interface BookDAO {

	Book get(int bookId);
	List<Book> list();
	boolean add(Book book);
	boolean update(Book book);
	boolean delete(Book book);
	
	// Business methods
	List<Book> listActiveBooks();
	List<Book> listActiveBooksByGenre(int genreId);
	List<Book> getLatestActiveBooks(int count);
	List<Book> getBestSellers(int count);
	void addRating(Book book, double rating);
}
