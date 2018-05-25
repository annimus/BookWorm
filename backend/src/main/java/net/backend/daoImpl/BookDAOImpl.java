package net.backend.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.backend.dao.BookDAO;
import net.backend.dto.Book;

@Repository("bookDAO")
@Transactional
public class BookDAOImpl implements BookDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Book get(int bookId) {
		try {
			return sessionFactory.getCurrentSession().get(Book.class, Integer.valueOf(bookId));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Book> list() {
		try {
			return sessionFactory.getCurrentSession().createQuery("FROM Book", Book.class).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean add(Book book) {
		try {
			sessionFactory.getCurrentSession().persist(book);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(Book book) {
		try {
			sessionFactory.getCurrentSession().update(book);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(Book book) {
		try {
			book.setActive(false);
			return this.update(book);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Book> listActiveBooks() {
		String selectActiveBooks = "FROM Book WHERE active = :active";

		return sessionFactory.getCurrentSession().createQuery(selectActiveBooks, Book.class)
				.setParameter("active", true).getResultList();
	}

	@Override
	public List<Book> listActiveBooksByGenre(int genreId) {
		String selectActiveBooksByGenre = "FROM Book WHERE active = :active AND genreId = :genreId";

		return sessionFactory.getCurrentSession().createQuery(selectActiveBooksByGenre, Book.class)
				.setParameter("active", true).setParameter("genreId", genreId).getResultList();
	}

	@Override
	public List<Book> getLatestActiveBooks(int count) {

		return sessionFactory.getCurrentSession()
				.createQuery("FROM Book WHERE active = :active ORDER BY id", Book.class).setParameter("active", true)
				.setFirstResult(0).setMaxResults(count).getResultList();
	}

	@Override
	public void addRating(Book book, double rating) {
		double currentRating = book.getRating();
		int currentRatingCount = book.getRatingCount();
		double newRating = ((currentRating * currentRatingCount) + rating) / (currentRatingCount + 1);
		
		book.setRating(newRating);
		book.setRatingCount(currentRatingCount + 1);
		
		this.update(book);
	}

}
