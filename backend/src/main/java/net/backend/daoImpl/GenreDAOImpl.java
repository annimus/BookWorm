package net.backend.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import net.backend.dao.GenreDAO;
import net.backend.dto.Genre;

@Repository("genreDAO")
public class GenreDAOImpl implements GenreDAO {

	// Dummy data for tests
	private static List<Genre> genres = new ArrayList<>();

	static {
		Genre genre = new Genre();
		genre.setId(1);
		genre.setName("Fantasy");
		genre.setDescription("This is a fantasy genre");
		genre.setImageURL("CAT_1.png");
		genre.setActive(true);

		genres.add(genre);

		genre = new Genre();
		genre.setId(2);
		genre.setName("Horror");
		genre.setDescription("This is a horror genre");
		genre.setImageURL("CAT_2.png");
		genre.setActive(true);

		genres.add(genre);

		genre = new Genre();
		genre.setId(3);
		genre.setName("SciFi");
		genre.setDescription("This is a SciFI genre");
		genre.setImageURL("CAT_3.png");
		genre.setActive(true);

		genres.add(genre);
	}

	@Override
	public List<Genre> list() {
		return genres;
	}

}
