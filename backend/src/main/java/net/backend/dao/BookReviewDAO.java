package net.backend.dao;

import java.util.List;

import net.backend.dto.BookReview;

public interface BookReviewDAO {

	List<BookReview> listByBook(int bookId);
	boolean add(BookReview bookReview);
}
