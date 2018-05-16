package net.bookworm.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import net.backend.dto.Book;

public class BookValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Book.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Book book = (Book) target;

		// Checks whether a file has been selected
		if ((book.getFile()) == null || (book.getFile().getOriginalFilename().equals(""))) {

			errors.rejectValue("file", null, "Please select an image to upload.");
			return;
		}

		if (!(book.getFile().getContentType().equals("image/jpeg")
				|| book.getFile().getContentType().equals("image/png"))) {
			
			errors.rejectValue("file", null, "Please select a .jpg or .png image.");
			return;
		}
	}

}
