package net.backend.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.backend.dao.GenreDAO;
import net.backend.dto.Genre;

@Repository("genreDAO")
@Transactional
public class GenreDAOImpl implements GenreDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Genre> list() {
	String query = "FROM Genre";

	try {
	    return sessionFactory.getCurrentSession().createQuery(query, Genre.class).getResultList();
	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
	}
    }

    @Override
    public List<Genre> listActiveGenres() {
	String selectActiveGenre = "FROM Genre WHERE active = :active";
	Query query = sessionFactory.getCurrentSession().createQuery(selectActiveGenre);

	query.setParameter("active", true);

	return query.getResultList();
    }

    @Override
    public Genre get(int id) {
	return sessionFactory.getCurrentSession().get(Genre.class, Integer.valueOf(id));
    }

    @Override
    public boolean add(Genre genre) {

	try {
	    // Adds the genre to the database
	    sessionFactory.getCurrentSession().persist(genre);
	    return true;

	} catch (Exception e) {
	    e.printStackTrace();
	    return false;
	}
    }

    @Override
    public boolean update(Genre genre) {
	try {
	    sessionFactory.getCurrentSession().update(genre);
	    return true;
	} catch (Exception e) {
	    e.printStackTrace();
	    return false;
	}
    }

    @Override
    public boolean delete(Genre genre) {
	genre.setActive(false);

	try {
	    sessionFactory.getCurrentSession().update(genre);
	    return true;
	} catch (Exception e) {
	    e.printStackTrace();
	    return false;
	}
    }

}
