package net.backend.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.backend.dao.BookReviewDAO;
import net.backend.dto.BookReview;

@Repository("bookReviewDAO")
@Transactional
public class BookReviewDAOImpl implements BookReviewDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<BookReview> listByBook(int bookId) {
		String query = "FROM BookReview WHERE bookId = :bookId";
		
		return sessionFactory.getCurrentSession().createQuery(query, BookReview.class)
				.setParameter("bookId", bookId).getResultList();
	}

	@Override
	public boolean add(BookReview bookReview) {
		try {
			sessionFactory.getCurrentSession().persist(bookReview);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
