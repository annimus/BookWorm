package net.backend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.backend.dao.BookDAO;
import net.backend.dao.CartLineDAO;
import net.backend.dao.UserDAO;
import net.backend.dto.Book;
import net.backend.dto.Cart;
import net.backend.dto.CartLine;
import net.backend.dto.User;

public class CartLineTestCase {
	
	private static AnnotationConfigApplicationContext context;
	
	private static CartLineDAO cartLineDAO = null;
	private static BookDAO bookDAO = null;
	private static UserDAO userDAO = null;
	
	private Book book = null;
	private User user = null;
	private Cart cart = null;
	private CartLine cartLine = null;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("net.backend");
		context.refresh();
		
		bookDAO = (BookDAO) context.getBean("bookDAO");
		userDAO = (UserDAO) context.getBean("userDAO");
		cartLineDAO = (CartLineDAO) context.getBean("cartLineDAO");
	}
	
	@Test
	public void testNewCartLine() {
		user = userDAO.getByEmail("user2@bookworm.com");
		cart = user.getCart();
		book = bookDAO.get(1);
		
		cartLine = new CartLine();
		cartLine.setBuyingPrice(book.getUnitPrice());
		cartLine.setBookCount(cartLine.getBookCount() + 1);
		cartLine.setTotal(cartLine.getBookCount() * book.getUnitPrice());
		cartLine.setAvailable(true);
		cartLine.setCartId(cart.getId());
		cartLine.setBook(book);
		
		assertEquals("Failed to add the cartLine", true, cartLineDAO.add(cartLine));
		
		cart.setGrandTotal(cart.getGrandTotal() + cartLine.getTotal());
		cart.setCartLines(cart.getCartLines() + 1);
		
		assertEquals("Failed to update the cart", true, cartLineDAO.updateCart(cart));
	}
	
}
