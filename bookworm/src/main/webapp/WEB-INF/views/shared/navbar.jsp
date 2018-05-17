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
				<li id="manageBooks"><a href="${contextRoot}/manage/books">Manage Books</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li id="register"><a href="${contextRoot}/register">Sign Up</a></li>
				<li id="login"><a href="${contextRoot}/login">Login</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>