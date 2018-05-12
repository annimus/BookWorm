package net.backend.dao;

import java.util.List;

import net.backend.dto.Genre;

public interface GenreDAO {

	List<Genre> list();
	Genre get(int id);
}
