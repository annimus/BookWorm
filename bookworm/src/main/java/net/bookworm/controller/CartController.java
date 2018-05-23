package net.bookworm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.bookworm.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;

	// Shows cart
	@RequestMapping("/show")
	public ModelAndView showCart(@RequestParam(name = "result", required = false) String result) {
		ModelAndView mv = new ModelAndView("page");
		
		if (result != null) {
			switch(result) {
				case "update":
					mv.addObject("message", "CartLine has been updated successfully!");
					break;
					
				case "delete":
					mv.addObject("message", "CartLine has been removed successfully!");
					break;
					
				case "added":
					mv.addObject("message", "CartLine has been added successfully!");
					break;
					
				case "unavailable":
					mv.addObject("message", "We don't have this many books!");
					break;
					
				case "error":
					mv.addObject("message", "Something went wrong with our application!");
					break;
			}
		}

		mv.addObject("title", "Cart");
		mv.addObject("userClickShowCart", true);
		mv.addObject("cartLines", cartService.getCartLines());

		return mv;
	}

	// Updates the cartLine
	@RequestMapping("/{cartLineId}/update")
	public String updateCart(@PathVariable int cartLineId, @RequestParam int count) {
		String response = cartService.manageCartLine(cartLineId, count);

		return "redirect:/cart/show?" + response;
	}
	
	// Deletes the cartLine
	@RequestMapping("/{cartLineId}/delete")
	public String delete(@PathVariable int cartLineId) {
		String response = cartService.deleteCartLine(cartLineId);

		return "redirect:/cart/show?" + response;
	}
	
	
	@RequestMapping("/add/{bookId}/book")
	public String addToCart(@PathVariable int bookId) {
		String response = cartService.addCartLine(bookId);

		return "redirect:/cart/show?" + response;
	}
}
