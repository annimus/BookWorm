<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!-- Page Content -->
<div class="container">

	<div class="row">

		<div class="col-md-3">
			<%@include file="./shared/sidebar.jsp"%>
		</div>

		<div class="col-md-9">

			<div class="row carousel-holder">

				<div class="col-md-12">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<!-- TODO Change this 3 div's to c:forEach. Create a CSS class to display the image in a vertical way. -->
							<!-- TODO Create a method to return the 3 latests books in promotion. Add a promotion and discount fields in book -->
							
							
							<div class="item active">
								<div class="col-md-4">
									<a href="${contextRoot}/show/${carousel_item_1.id}/book">
										<img class="slide_image carouselImg" src="${images}/${carousel_item_1.code}.jpg"
										alt="${carousel_item_1.name}">
									</a>
								</div>
								<div class="col-md-8">
									<a href="${contextRoot}/show/${carousel_item_1.id}/book">
										<h2>${carousel_item_1.name}</h2>
									</a>
									<h3>By: ${carousel_item_1.author}</h3>
									<p class="largeFont textInline">
										Rating: ${carousel_item_1.rating}<font class="textInline xLargeFont">/5</font>
										<br/>
										Price: &#36;${carousel_item_1.unitPrice}
									</p>
								</div>
							</div>
							
							<div class="item">
								<div class="col-md-4">
									<a href="${contextRoot}/show/${carousel_item_2.id}/book">
										<img class="slide_image carouselImg" src="${images}/${carousel_item_2.code}.jpg"
										alt="${carousel_item_2.name}">
									</a>
								</div>
								<div class="col-md-8">
									<a href="${contextRoot}/show/${carousel_item_2.id}/book">
										<h2>${carousel_item_2.name}</h2>
									</a>
									<h3>By: ${carousel_item_2.author}</h3>
									<p class="largeFont textInline">
										Rating: ${carousel_item_2.rating}<font class="textInline xLargeFont">/5</font>
										<br/>
										Price: &#36;${carousel_item_2.unitPrice}
									</p>
								</div>
							</div>
							
							<div class="item">
								<div class="col-md-4">
									<a href="${contextRoot}/show/${carousel_item_3.id}/book">
										<img class="slide_image carouselImg" src="${images}/${carousel_item_3.code}.jpg"
										alt="${carousel_item_3.name}">
									</a>
								</div>
								<div class="col-md-8">
									<a href="${contextRoot}/show/${carousel_item_3.id}/book">
										<h2>${carousel_item_3.name}</h2>
									</a>
									<h3>By: ${carousel_item_3.author}</h3>
									<p class="largeFont textInline">
										Rating: ${carousel_item_3.rating}<font class="textInline xLargeFont">/5</font>
										<br/>
										Price: &#36;${carousel_item_3.unitPrice}
									</p>
								</div>
							</div>
							
						</div>
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				</div>

			</div>
			<hr />
			<!-- Best Sellers -->
			<div class="row">
				<h3>Our Best Sellers:</h3>
				<br />
				<!-- TODO Change this 5 div's to c:forEach. Create a method to return the 6 most sold books.  -->
				<c:forEach items="${bestSellerList}" var="bestSellerItem">
					<div class="col-sm-4 col-lg-4 col-md-4">
						<a href="${contextRoot}/show/${bestSellerItem.id}/book">
							<img class="img-responsive bestSellerImg" src="${images}/${bestSellerItem.code}.jpg" alt="${bestSellerItem.name}">
						</a>
						<div class="caption">
							<h4>
								<a href="${contextRoot}/show/${bestSellerItem.id}/book">${bestSellerItem.name}</a>
							</h4>
							<h4>&#36;${bestSellerItem.unitPrice}</h4>
							<p>By: ${bestSellerItem.author}</p>
							<p>Publisher: ${bestSellerItem.publisher}</p>
						</div>
						<div class="ratings">
							<p class="pull-right">${bestSellerItem.ratingCount} Reviews</p>
							<p>Rating: ${bestSellerItem.rating}<strong class="largeFont">/5</strong></p>
						</div>
					</div>
				</c:forEach>
			</div>
			<hr />
			
			<!-- User Recommendations -->
			<security:authorize access="hasAuthority('USER')">
				<div class="row">
					<h3>Recommended for you:</h3>
					<br />
					<div class="col-sm-4 col-lg-4 col-md-4">
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
					<div class="col-sm-4 col-lg-4 col-md-4">
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
					<div class="col-sm-4 col-lg-4 col-md-4">
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
					<div class="col-sm-4 col-lg-4 col-md-4">
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

</div>
<!-- /.container -->