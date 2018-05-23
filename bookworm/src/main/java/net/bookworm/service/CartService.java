package net.bookworm.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.backend.dao.BookDAO;
import net.backend.dao.CartLineDAO;
import net.backend.dto.Book;
import net.backend.dto.Cart;
import net.backend.dto.CartLine;
import net.bookworm.model.UserModel;

@Service("cartService")
public class CartService {

	@Autowired
	private CartLineDAO cartLineDAO;
	
	@Autowired
	private BookDAO bookDAO;

	@Autowired
	private HttpSession session;
	
	private Cart getCart() {

		return ((UserModel) session.getAttribute("userModel")).getCart();
	}

	public List<CartLine> getCartLines() {
		return cartLineDAO.list(this.getCart().getId());
	}

	public String manageCartLine(int cartLineId, int count) {
		CartLine cartLine = cartLineDAO.get(cartLineId);

		if (cartLine == null) {
			return "result=error";
		} else {
			Book book = cartLine.getBook();
			double oldTotal = cartLine.getTotal();

			if (book.getQuantity() < count) {
				return "result=unavailable";
			}

			cartLine.setBookCount(count);
			cartLine.setBuyingPrice(book.getUnitPrice());

			cartLine.setTotal(book.getUnitPrice() * count);

			cartLineDAO.update(cartLine);

			Cart cart = this.getCart();
			
			cart.setGrandTotal(cart.getGrandTotal() - oldTotal + cartLine.getTotal());

			cartLineDAO.updateCart(cart);

			return "result=update";
		}
	}

	public String deleteCartLine(int cartLineId) {
		CartLine cartLine = cartLineDAO.get(cartLineId);
		
		if (cartLine == null) {
			return "result=error";
		} else {
			Cart cart = this.getCart();
			
			cart.setGrandTotal(cart.getGrandTotal() - cartLine.getTotal());
			
			cart.setCartLines(cart.getCartLines() - 1);
			
			cartLineDAO.delete(cartLine);
			cartLineDAO.updateCart(cart);
			
			return "result=delete";
		}
	}

	public String addCartLine(int bookId) {
		String response = null;
		
		Cart cart = this.getCart();
		CartLine cartLine = cartLineDAO.getByCartAndBook(cart.getId(), bookId);
		
		if (cartLine == null) {
			cartLine = new CartLine();
			Book book = bookDAO.get(bookId);
			
			cartLine.setCartId(cart.getId());
			cartLine.setBook(book);
			cartLine.setBuyingPrice(book.getUnitPrice());
			cartLine.setBookCount(1);
			cartLine.setTotal(book.getUnitPrice());
			cartLine.setAvailable(true);
			
			cartLineDAO.add(cartLine);
			
			cart.setCartLines(cart.getCartLines() + 1);
			cart.setGrandTotal(cart.getGrandTotal() + cartLine.getTotal());
			
			cartLineDAO.updateCart(cart);
			
			response = "result=added";
		} else {
			response = this.manageCartLine(cartLine.getId(), cartLine.getBookCount() + 1);
		}
		
		return response;
	}
}
