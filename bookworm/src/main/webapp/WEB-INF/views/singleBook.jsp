<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div class="container">
	<script>
		window.bookId = '${book.id}';
	</script>
	<!-- Breadcrumb -->
	<div class="row">
		<div class="col-xs-12">
			<ol class="breadcrumb">
				<li><a href="${contextRoot}/home">Home</a></li>
				<li><a href="${contextRoot}/show/all/books">All Books</a></li>
				<li class="active">${book.name}</li>
			</ol>
		</div>
	</div>

	<!-- Book display -->
	<div class="row">

		<!-- Image -->
		<div class="col-xs-12 col-sm-4">
			<div class="thumbnail">
				<img src="${images}/${book.code}.jpg" class="img img-responsive" />
			</div>
		</div>

		<!-- Description -->
		<div class="col-xs-12 col-sm-8">
			<h3>
				<strong>${book.name}</strong>
			</h3>
			<h4>By: ${book.author}</h4>
			<h5>Publisher: ${book.publisher}</h5>
			<hr />
			<h5>
				<strong>Description:</strong>
			</h5>
			<p>${book.description}</p>
			<hr />
			<div class="textInline">
				<h3 class="textInline">
					Rating: ${book.rating}
					<h2 class="textInline">/5</h2>
				</h3>
			</div>
			<security:authorize access="hasAuthority('USER')">
				<br />
				<br />
				<button type="button" data-toggle="modal"
					data-target="#submitReviewModal" class="btn btn-info">Write
					a Review!</button>
			</security:authorize>

			<hr />
			<h4>
				Price: <strong> &#36; ${book.unitPrice}</strong>
			</h4>
			<hr />
			<c:choose>
				<c:when test="${book.quantity < 1}">
					<h6>
						<span style="color: red">Out of Stock!</span>
					</h6>
				</c:when>
				<c:otherwise>
					<h6>
						<span style="color: green">Ready for Delivery</span>
					</h6>
				</c:otherwise>
			</c:choose>

			<security:authorize access="hasAuthority('USER')">
				<c:choose>
					<c:when test="${book.quantity < 1}">
						<a href="javascript:void(0)" class="btn btn-success disabled">
							<span class="glyphicon glyphicon-shopping-cart strikethrough">Add
								to Cart</span>
						</a>
					</c:when>
					<c:otherwise>
						<a href="${contextRoot}/cart/add/${book.id}/book"
							class="btn btn-success"> <span
							class="glyphicon glyphicon-shopping-cart">Add to Cart</span>
						</a>
					</c:otherwise>
				</c:choose>
			</security:authorize>

			<security:authorize access="hasAuthority('ADMIN')">
				<a href="${contextRoot}/manage/${book.id}/book"
					class="btn btn-warning"> <span
					class="glyphicon glyphicon-pencil">Edit</span>
				</a>
			</security:authorize>

			<a href="${contextRoot}/show/all/books" class="btn btn-primary">Back</a>

		</div>
	</div>
	<hr/>
	<div class="row">
		<security:authorize access="hasAuthority('USER')">
			<div class="row">
				<h3>Customers who bought this book also bought:</h3>
				<br />
				<div class="col-sm-3 col-lg-3 col-md-3">
					<div class="thumbnail">
						<img src="http://placehold.it/320x150" alt="">
						<div class="caption">
							<h4 class="pull-right">$24.99</h4>
							<h4>
								<a href="#">Recommendation 1</a>
							</h4>
							<p>Author: Author 1</p>
							<p>Publisher: Publisher 1</p>
						</div>
						<div class="ratings">
							<p class="pull-right">15 reviews</p>
							<p>
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-lg-3 col-md-3">
					<div class="thumbnail">
						<img src="http://placehold.it/320x150" alt="">
						<div class="caption">
							<h4 class="pull-right">$54.99</h4>
							<h4>
								<a href="#">Recommendation 2</a>
							</h4>
							<p>Author: Author 2</p>
							<p>Publisher: Publisher 2</p>
						</div>
						<div class="ratings">
							<p class="pull-right">55 reviews</p>
							<p>
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-lg-3 col-md-3">
					<div class="thumbnail">
						<img src="http://placehold.it/320x150" alt="">
						<div class="caption">
							<h4 class="pull-right">$34.99</h4>
							<h4>
								<a href="#">Recommendation 3</a>
							</h4>
							<p>Author: Author 3</p>
							<p>Publisher: Publisher 3</p>
						</div>
						<div class="ratings">
							<p class="pull-right">17 reviews</p>
							<p>
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-lg-3 col-md-3">
					<div class="thumbnail">
						<img src="http://placehold.it/320x150" alt="">
						<div class="caption">
							<h4 class="pull-right">$43.99</h4>
							<h4>
								<a href="#">Recommendation 4</a>
							</h4>
							<p>Author: Author 4</p>
							<p>Publisher: Publisher 4</p>
						</div>
						<div class="ratings">
							<p class="pull-right">15 reviews</p>
							<p>
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</security:authorize>
	</div>

	<hr />

	<!-- Book Reviews Display -->
	<div class="row">
		<table class="table table-striped table-hover" id="reviewTable">
			<caption class="reviewTable text-center">Reviews</caption>

			<thead>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>

			<tfoot>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</tfoot>
		</table>
	</div>

	<div class="modal fade" id="submitReviewModal" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h4 class="modal-title">Write a review for: ${book.name}</h4>
				</div>

				<!-- Modal Body -->
				<div class="modal-body">
					<!-- Review Submission Form -->
					<sf:form id="bookReviewForm" modelAttribute="bookReview"
						action="${contextRoot}/review/book/${book.id}/submit"
						method="POST" class="form-horizontal">

						<div class="form-group">
							<label for="userName" class="control-label col-md-4">User:
							</label>
							<div class="col-md-8">
								<sf:input type="text" path="userName" id="userName"
									value="${userModel.fullName}" readonly="true" />
							</div>
						</div>

						<div class="form-group">
							<label for="description" class="control-label col-md-4">Tell
								us what do you think about this book: </label>
							<div class="col-md-8">
								<sf:textarea path="description" id="description" rows="4"
									placeholder="Write a small review for the book."
									class="form-control"></sf:textarea>
							</div>
						</div>

						<div class="form-group">
							<label for="rating" class="control-label col-md-4">Rating:</label>
							<div class="col-md-8">
								<sf:input type="number" path="rating" class="form-control"
									min="0" max="5" step="0.5" value="2.5" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" value="Submit Review"
									class="btn btn-success" />
							</div>
						</div>

						<!-- Hidden Fields -->
						<sf:hidden path="id" />
						<sf:hidden path="bookId" />

					</sf:form>
				</div>
			</div>
		</div>
	</div>
</div>