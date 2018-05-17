package net.backend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.backend.dao.UserDAO;
import net.backend.dto.Address;
import net.backend.dto.Cart;
import net.backend.dto.User;

public class UserTestCase {

    private static AnnotationConfigApplicationContext context;
    private static UserDAO userDAO;
    private User user = null;
    private Cart cart = null;
    private Address address = null;

    @BeforeClass
    public static void init() {
	context = new AnnotationConfigApplicationContext();
	context.scan("net.backend");
	context.refresh();

	userDAO = (UserDAO) context.getBean("userDAO");
    }

    /*
    @Test
    public void testAdd() {
	user = new User();
	user.setFirstName("Test");
	user.setLastName("Test");
	user.setEmail("test@test.com");
	user.setContactNumber("123456789");
	user.setRole("USER");
	user.setPassword("12345");

	assertEquals("Failed to add user", true, userDAO.addUser(user));

	address = new Address();
	address.setAddressLineOne("Address Line One");
	address.setAddressLineTwo("Address Line Two");
	address.setCity("Test");
	address.setState("Test");
	address.setCountry("Test");
	address.setPostalCode("12031230");
	address.setBilling(true);
	address.setUserId(user.getId());

	assertEquals("Failed to add billing address", true, userDAO.addAddress(address));

	if (user.getRole().equals("USER")) {
	    cart = new Cart();
	    cart.setUser(user);
	    
	    assertEquals("Failed to add cart", true, userDAO.addCart(cart));
	    
	    // shipping address
	    address = new Address();
	    address.setAddressLineOne("Address Line One");
	    address.setAddressLineTwo("Address Line Two");
	    address.setCity("Test");
	    address.setState("Test");
	    address.setCountry("Test");
	    address.setPostalCode("12031230");
	    address.setShipping(true);
	    address.setUserId(user.getId());
	    
	    assertEquals("Failed to add shipping address", true, userDAO.addAddress(address));
	}

    } */
    /*
    @Test
    public void testAdd() {
	user = new User();
	user.setFirstName("Test");
	user.setLastName("Test");
	user.setEmail("test@test.com");
	user.setContactNumber("123456789");
	user.setRole("USER");
	user.setPassword("12345");

	if (user.getRole().equals("USER")) {
	    cart = new Cart();
	    cart.setUser(user);
	    
	    user.setCart(cart);
	}
	
	assertEquals("Failed to add user", true, userDAO.addUser(user));

    }*/
    /*
    @Test
    public void testUpdateCart() {
	user = userDAO.getByEmail("test@test.com");
	cart = user.getCart();
	
	cart.setGrandTotal(666);
	cart.setCartLines(2);
	
	assertEquals("Failed to update the cart.", true, userDAO.updateCart(cart));
    }*/
    
    /*
    @Test
    public void testAddAddress() {
	user = new User();
	user.setFirstName("Test");
	user.setLastName("Test");
	user.setEmail("test@test.com");
	user.setContactNumber("123456789");
	user.setRole("USER");
	user.setPassword("12345");

	assertEquals("Failed to add user", true, userDAO.addUser(user));

	address = new Address();
	address.setAddressLineOne("Address Line One");
	address.setAddressLineTwo("Address Line Two");
	address.setCity("Test");
	address.setState("Test");
	address.setCountry("Test");
	address.setPostalCode("12031230");
	address.setBilling(true);
	address.setUser(user);
	
	assertEquals("Failed to add billing address", true, userDAO.addAddress(address));
	
	// shipping address
	address = new Address();
        address.setAddressLineOne("Address Line One");
        address.setAddressLineTwo("Address Line Two");
        address.setCity("Test");
        address.setState("Test");
        address.setCountry("Test");
        address.setPostalCode("12031230");
        address.setShipping(true);
        address.setUser(user);
	    
	assertEquals("Failed to add shipping address", true, userDAO.addAddress(address));
    }*/
    
    /*
    @Test
    public void testAddAddress() {
	user = userDAO.getByEmail("test@test.com");
	
	// shipping address
	address = new Address();
	address.setAddressLineOne("Address Line One test");
	address.setAddressLineTwo("Address Line Two test");
	address.setCity("Test 2");
	address.setState("Test 2");
	address.setCountry("Test 2");
	address.setPostalCode("120312asdasd30");
	address.setShipping(true);
	address.setUser(user);
		    
	assertEquals("Failed to add shipping address", true, userDAO.addAddress(address));
    }*/
    
    @Test
    public void testGetAddress() {
	user = userDAO.getByEmail("test@test.com");
	
	assertEquals("Failed to fetch the list of address", 2, userDAO.listShippingAddress(user).size());
	assertEquals("Failed to fetch the billing address", "Test", userDAO.getBillingAddress(user).getCity());
    }
}
