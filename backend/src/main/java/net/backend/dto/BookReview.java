package net.backend.dto;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "book_review")
public class BookReview implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "book_id")
	private int bookId;
	
	@Column(name = "user_name")
	private String userName;
	
	private String description;
	
	private double rating;
	
	@Column(name = "review_date")
	private Date reviewDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getReviewDate() {
		SimpleDateFormat formater = new SimpleDateFormat("MM/dd/yyyy");
		return formater.format(reviewDate);
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	@Override
	public String toString() {
		return "BookReview [id=" + id + ", bookId=" + bookId + ", userName=" + userName + ", description=" + description
				+ ", rating=" + rating + ", reviewDate=" + reviewDate + "]";
	}
	
}
