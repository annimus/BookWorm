package net.backend.dto;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

@Entity
public class Book {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "code")
	private String code;

	@NotBlank(message = "Please enter the book name.")
	@Column(name = "name")
	private String name;

	@NotBlank(message = "Please enter the publisher's name.")
	@Column(name = "publisher")
	private String publisher;

	@NotBlank(message = "Please enter the author's name.")
	@Column(name = "author")
	private String author;

	@NotBlank(message = "Please enter a short description for the book.")
	@Column(name = "description")
	private String description;

	@Min(value = 1, message = "Please enter the unit price in $XX.XX")
	@Column(name = "unit_price")
	private double unitPrice;

	@Min(value = 0, message="Book quantity can't be less than 0.")
	@Column(name = "quantity")
	private int quantity;

	@Column(name = "is_active")
	private boolean active = true;

	@Column(name = "genre_id")
	private int genreId;

	@Column(name = "supplier_id")
	private int supplierId;

	@Column(name = "purchases")
	private int purchases;

	@Column(name = "views")
	private int views;

	@Min(value = 1, message = "Please enter the book's I.S.B.N..")
	@Column(name = "isbn")
	private int isbn;
	
	@Column(name = "rating")
	private double rating;
	
	@Column(name = "rating_count")
	private int ratingCount;
	
	@Transient
	private MultipartFile file;

	public Book() {
		this.code = "BK" + UUID.randomUUID().toString().toUpperCase();
	}

	// Getter and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public int getGenreId() {
		return genreId;
	}

	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}

	public int getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}

	public int getPurchases() {
		return purchases;
	}

	public void setPurchases(int purchases) {
		this.purchases = purchases;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public int getRatingCount() {
		return ratingCount;
	}

	public void setRatingCount(int ratingCount) {
		this.ratingCount = ratingCount;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", code=" + code + ", name=" + name + ", publisher=" + publisher + ", author="
				+ author + ", description=" + description + ", unitPrice=" + unitPrice + ", quantity=" + quantity
				+ ", active=" + active + ", genreId=" + genreId + ", supplierId=" + supplierId + ", purchases="
				+ purchases + ", views=" + views + ", isbn=" + isbn + "]";
	}
}
