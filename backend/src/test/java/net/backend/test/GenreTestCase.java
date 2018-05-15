package net.backend.test;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.backend.dao.GenreDAO;
import net.backend.dto.Genre;

public class GenreTestCase {

	private static AnnotationConfigApplicationContext context;
	private static GenreDAO genreDAO;
	private Genre genre;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("net.backend");
		context.refresh();

		genreDAO = (GenreDAO) context.getBean("genreDAO");

	}
	
	@Test
	public void testCRUD() {
		genre = new Genre();
		genre.setName("Fantasy");
		genre.setDescription("This is a fantasy genre.");
		genre.setImageURL("CAT_1.png");
		genre.setActive(true);
		
		Assert.assertEquals("Something went wrong while adding the genre.", true, genreDAO.add(genre));
		
		genre = new Genre();
		genre.setName("Adventure");
		genre.setDescription("This is a adventure genre.");
		genre.setImageURL("CAT_2.png");
		genre.setActive(true);
		
		Assert.assertEquals("Something went wrong while adding genre.", true, genreDAO.add(genre));
		
		genre = genreDAO.get(1);
		
		Assert.assertEquals("Something went wrong while fetching the genre", "Mythology", genre.getName());
		
		genre = genreDAO.get(2);
		
		genre.setName("Action & Adventure");
		
		Assert.assertEquals("Something went wrong while updating the genre", true, genreDAO.update(genre));
		
		genre = genreDAO.get(2);
		Assert.assertEquals("Something went wrong while deleting the genre", true, genreDAO.delete(genre));
		
		Assert.assertEquals("Something went wrong while listing the active genres", 1, genreDAO.list().size());
	}
}
