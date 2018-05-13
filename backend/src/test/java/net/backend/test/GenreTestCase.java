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
	
	/*@Test
	public void testAddGenre() {
		genre = new Genre();
		
		genre.setName("Fantasy");
		genre.setDescription("This is a fantasy genre.");
		genre.setImageURL("CAT_1.png");
		genre.setActive(true);
		
		Assert.assertEquals("Successfully added genre.", true, genreDAO.add(genre));
	}*/
	
	/*@Test
	public void testGetGenre() {
		genre = genreDAO.get(1);
		
		Assert.assertEquals("Successfully fetched the genre", "Romance", genre.getName());
	}*/
	
	/*@Test
	public void testUpdateGenre() {
		genre = genreDAO.get(1);
		
		genre.setName("Drama & Romance");
		
		Assert.assertEquals("Successfully updated the genre", true, genreDAO.update(genre));
	}*/
	
	/*@Test
	public void testDeleteGenre() {
		genre = genreDAO.get(2);
		Assert.assertEquals("Successfully deleted the genre", true, genreDAO.delete(genre));
	}*/
	
	/*@Test
	public void testListGenre() {
		Assert.assertEquals("Successfully listed the active genres", 2, genreDAO.list().size());
	}*/
	
	@Test
	public void testCRUD() {
		genre = new Genre();
		genre.setName("Fantasy");
		genre.setDescription("This is a fantasy genre.");
		genre.setImageURL("CAT_1.png");
		genre.setActive(true);
		
		Assert.assertEquals("Successfully added genre.", true, genreDAO.add(genre));
		
		genre = new Genre();
		genre.setName("Adventure");
		genre.setDescription("This is a adventure genre.");
		genre.setImageURL("CAT_2.png");
		genre.setActive(true);
		
		Assert.assertEquals("Successfully added genre.", true, genreDAO.add(genre));
		
		genre = genreDAO.get(1);
		
		Assert.assertEquals("Successfully fetched the genre", "Fantasy", genre.getName());
		
		genre = genreDAO.get(2);
		
		genre.setName("Action & Adventure");
		
		Assert.assertEquals("Successfully updated the genre", true, genreDAO.update(genre));
		
		genre = genreDAO.get(2);
		Assert.assertEquals("Successfully deleted the genre", true, genreDAO.delete(genre));
		
		Assert.assertEquals("Successfully listed the active genres", 1, genreDAO.list().size());
	}
}
