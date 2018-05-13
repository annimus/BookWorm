package net.backend.dao;

import java.util.List;

import net.backend.dto.Genre;

public interface GenreDAO {

	List<Genre> list();
	Genre get(int id);
	boolean add(Genre genre);
	boolean update(Genre genre);
	boolean delete(Genre genre);
}
