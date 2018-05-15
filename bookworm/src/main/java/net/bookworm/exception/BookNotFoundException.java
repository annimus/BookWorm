package net.bookworm.exception;

import java.io.Serializable;

public class BookNotFoundException extends Exception implements Serializable {

	private static final long serialVersionUID = 1L;
	private String message;

	public BookNotFoundException() {
		this("Book not available!");
	}

	public BookNotFoundException(String mgs) {
		this.message = System.currentTimeMillis() + " " + mgs;
	}

	public String getMessage() {
		return message;
	}

}
