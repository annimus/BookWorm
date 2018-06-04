<div class="container">
	<c:if test="${not empty message}">
		<div class="alert alert-info">
			<h3 class="text-center">${message}</h3>
		</div>
	</c:if>

	<c:choose>
		<c:when test="${not empty cartLines}">
			<table id="cart" class="table table-hover table-condensed">
				<thead>
					<tr>
						<th style="width: 50%">Product</th>
						<th style="width: 10%">Price</th>
						<th style="width: 8%">Quantity</th>
						<th style="width: 22%" class="text-center">Subtotal</th>
						<th style="width: 10%"></th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${cartLines}" var="cartLine">
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<img src="${images}/${cartLine.book.code}.jpg"
											alt="${cartLine.book.name}" class="img-responsive cartImg" />
									</div>
									<div class="col-sm-10">
										<h4 class="nomargin">${cartLine.book.name}
											<c:if test="${cartLine.available == false}">
												<strong class="unavailable">(Not Available)</strong>
											</c:if>
										</h4>
										<p>Author: ${cartLine.book.author}</p>
										<p>Publisher: ${cartLine.book.publisher}</p>

									</div>
								</div>
							</td>
							<td data-th="Price">&#36; ${cartLine.buyingPrice}</td>
							<td data-th="Quantity"><input type="number"
								id="count_${cartLine.id}" min="1"
								class="form-control text-center" value="${cartLine.bookCount}"></td>
							<td data-th="Subtotal" class="text-center">&#36;
								${cartLine.total}</td>
							<td class="actions" data-th="">
								<button type="button" name="refreshCart" value="${cartLine.id}"
									class="btn btn-info btn-sm">
									<span class="glyphicon glyphicon-refresh"></span>
								</button> <a href="${contextRoot}/cart/${cartLine.id}/delete"
								class="btn btn-danger btn-sm"> <span
									class="glyphicon glyphicon-trash"></span>
							</a>
							</td>
						</tr>
					</c:forEach>

				</tbody>
				<tfoot>
					<tr class="visible-xs">
						<td class="text-center"><strong>Total: &#36;
								${userModel.cart.grandTotal}</strong></td>
					</tr>
					<tr>
						<td><a href="${contextRoot}/show/all/books"
							class="btn btn-primary"> <span
								class="glyphicon glyphicon-chevron-left"></span> Continue
								Shopping
						</a></td>
						<td colspan="2" class="hidden-xs"></td>
						<td class="hidden-xs text-center"><strong>Total:
								&#36; ${userModel.cart.grandTotal}</strong></td>
						<td><a href="#" class="btn btn-success btn-block">Checkout
								<span class="glyphicon glyphicon-chevron-right"></span>
						</a></td>
					</tr>
				</tfoot>
			</table>
		</c:when>

		<c:otherwise>
			<div class="jumbotron">
				<div class="text-center">
					<h1>Your cart is empty!</h1>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<hr />
	<div class="row">
		<security:authorize access="hasAuthority('USER')">
			<div class="row">
				<h3>Recommended for you:</h3>
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
</div>