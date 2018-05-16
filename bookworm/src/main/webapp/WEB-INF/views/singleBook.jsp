<div class="container">
	<!-- Breadcrumb -->
	<div class="row">
		<div class="col-xs-12">
			<ol class="breadcrumb">
				<li><a href="${contextRoot}/home">Home</a></li>
				<li><a href="${contextRoot}/show/all/books">Books</a></li>
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

			<c:choose>
				<c:when test="${book.quantity < 1}">
					<a href="javascript:void(0)" class="btn btn-success disabled"> 
						<span class="glyphicon glyphicon-shopping-cart strikethrough">Add to Cart</span>
					</a>
				</c:when>
				<c:otherwise>
					<a href="${contextRoot}/cart/add/${book.id}/book" class="btn btn-success"> 
						<span class="glyphicon glyphicon-shopping-cart">Add to Cart</span>
					</a>
				</c:otherwise>
			</c:choose>
			
			</a> <a href="${contextRoot}/show/all/books" class="btn btn-primary">Back</a>

		</div>
	</div>
</div>