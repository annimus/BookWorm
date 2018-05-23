package net.backend.dao;

import java.util.List;

import net.backend.dto.Cart;
import net.backend.dto.CartLine;

public interface CartLineDAO {

	public CartLine get(int id);
	public boolean add(CartLine cartLine);
	public boolean update(CartLine cartLine);
	public boolean delete(CartLine cartLine);
	public List<CartLine> list(int cartId);
	public List<CartLine> listAvailable(int cartId);
	public CartLine getByCartAndBook(int cartId, int bookId);
	
	boolean updateCart(Cart cart);
}