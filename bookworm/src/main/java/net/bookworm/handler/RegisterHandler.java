package net.bookworm.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import net.backend.dao.UserDAO;
import net.backend.dto.Address;
import net.backend.dto.Cart;
import net.backend.dto.User;
import net.bookworm.model.RegisterModel;

@Component
public class RegisterHandler {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	public RegisterModel init() {
		return new RegisterModel();
	}

	public void addUser(RegisterModel registerModel, User user) {
		registerModel.setUser(user);
	}

	public void addBilling(RegisterModel registerModel, Address address) {
		registerModel.setBilling(address);
	}

	public String saveAll(RegisterModel model) {
		String transitionValue = "success";
		User user = model.getUser();
		Address billing = model.getBilling();

		if (user.getRole().equals("USER")) {
			Cart cart = new Cart();
			cart.setUser(user);
			user.setCart(cart);
		}
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		userDAO.addUser(user);

		billing.setUser(user);
		billing.setBilling(true);

		userDAO.addAddress(billing);

		return transitionValue;
	}

	public String validateUser(User user, MessageContext error) {
		String transitionValue = "success";

		// Checks if the passwords matches
		if (!(user.getPassword().equals(user.getConfirmPassword()))) {
			transitionValue = "failure";
			error.addMessage(new MessageBuilder().error().source("confirmPassword")
					.defaultText("Password does not match.").build());
		}

		if (userDAO.getByEmail(user.getEmail()) != null) {
			transitionValue = "failure";
			error.addMessage(
					new MessageBuilder().error().source("email").defaultText("Email already being used.").build());
		}

		return transitionValue;
	}
}
