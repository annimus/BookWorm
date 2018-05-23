package net.backend.dao;

import java.util.List;

import net.backend.dto.Address;
import net.backend.dto.User;

public interface UserDAO {

    boolean addUser(User user);
    
    User getByEmail(String email);
    
    boolean addAddress(Address address);
    
    Address getBillingAddress(User user);
    
    List<Address> listShippingAddress(User user);
    
}
