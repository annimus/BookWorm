<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" id="home" href="${contextRoot}/home">BookWorm</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li id="about"><a href="${contextRoot}/about">About Us</a></li>
				<li id="contact"><a href="${contextRoot}/contact">Contact Us</a></li>
				<li id="listBooks"><a href="${contextRoot}/show/all/books">Our Collection</a></li>
				<security:authorize access="hasAuthority('ADMIN')">
					<li id="manageBooks"><a href="${contextRoot}/manage/books">Manage Books</a></li>
				</security:authorize>
				<security:authorize access="hasAuthority('ADMIN')">
					<li id="manageGenres"><a href="${contextRoot}/manage/genres">Manage Genres</a></li>
				</security:authorize>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<security:authorize access="isAnonymous()">
					<li id="register"><a href="${contextRoot}/register">Sign Up</a></li>
					<li id="login"><a href="${contextRoot}/login">Login</a></li>
				</security:authorize>
				
				<security:authorize access="isAuthenticated()">
					<li class="dropdown" id="userCart">
						<a href="javascript:void(0)" class="btn btn-outline-primary" 
							id="dropdownMenu1" data-toggle="dropdown">
						
							${userModel.fullName}
							<span class="caret"></span>	
						</a>
						<ul class="dropdown-menu">
							<security:authorize access="hasAuthority('USER')">
								<li>
									<a href="${contextRoot}/cart/show">
										<span class="glyphicon glyphicon-shopping-cart"></span>
										<span class="badge">${userModel.cart.cartLines}</span>
										- &#36; ${userModel.cart.grandTotal}
									</a>
								</li>
								<li class="divider" role="seprator"></li>
							</security:authorize>
							
							<li>
								<a href="${contextRoot}/perform-logout">Logout</a>
							</li>
						</ul>
					</li>
				</security:authorize>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>

<script>
	window.userRole = '${userModel.role}';
</script>