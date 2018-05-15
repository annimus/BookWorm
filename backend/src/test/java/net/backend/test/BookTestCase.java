package net.backend.test;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import org.junit.Assert;
import net.backend.dao.BookDAO;
import net.backend.dto.Book;

public class BookTestCase {
    private static AnnotationConfigApplicationContext context;
    private static BookDAO bookDAO;
    private Book book;

    @BeforeClass
    public static void init() {
	context = new AnnotationConfigApplicationContext();
	context.scan("net.backend");
	context.refresh();

	bookDAO = (BookDAO) context.getBean("bookDAO");
    }

    @Test
    public void testCRUD() {
	// Create Test
	book = new Book();
	book.setName("Test Book");
	book.setPublisher("Test Publisher");
	book.setAuthor("Test Author");
	book.setDescription("Test Description");
	book.setUnitPrice(99.99);
	book.setQuantity(999);
	book.setActive(true);
	book.setGenreId(1);
	book.setSupplierId(2);
	book.setPurchases(0);
	book.setViews(0);
	book.setIsbn(999999999);

	Assert.assertEquals("Something went wrong while adding the book", true, bookDAO.add(book));

	// Retrieve Test;
	book = null;
	book = bookDAO.get(4);
	Assert.assertEquals("Something went wrong while retreaving the book", "Test Book", book.getName());

	// Update Test
	book.setName("Test Book 2");
	Assert.assertEquals("Something went wrong while updating the book.", true, bookDAO.update(book));

	// Delete Test
	Assert.assertEquals("Something went wrong while deleting the book.", true, bookDAO.delete(book));

	// List Books Test
	Assert.assertEquals("Something went wrong while listing the active books", 4, bookDAO.list().size());

	// List Active Books Test
	Assert.assertEquals("Something went wrong while listing the active books", 3, bookDAO.listActiveBooks().size());

	// List Active Books by Genre Test
	Assert.assertEquals("Something went wrong while listing the active books by genre.", 2,
		bookDAO.listActiveBooksByGenre(3).size());
	Assert.assertEquals("Something went wrong while listing the active books by genre.", 1,
		bookDAO.listActiveBooksByGenre(2).size());

	// Get Latest Active Books Test
	Assert.assertEquals("Something went wrong while listing the latests active books.", 2,
		bookDAO.getLatestActiveBooks(2).size());
    }
}
