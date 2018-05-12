<div class="container">
	<div class="row">
		<!-- Display sidebar -->
		<div class="col-md-3">
			<%@include file="./shared/sidebar.jsp"%>
		</div>

		<!-- Display books -->
		<div class="col-md-9">

			<!-- Added breadcrum component -->
			<div class="row">
				<div class="col-lg-12">

					<!-- All Books -->
					<c:if test="${userClickAllBooks == true}">
						<ol class="breadcrumb">

							<li><a href="${contextRoot}/home">Home</a></li>
							<li class="active">All Books</li>


						</ol>
					</c:if>

					<!-- Books by genre -->
					<c:if test="${userClickGenreBooks == true}">
						<ol class="breadcrumb">

							<li><a href="${contextRoot}/home">Home</a></li>
							<li class="active">Genre</li>
							<li class="active">${genre.name}</li>


						</ol>
					</c:if>
				</div>
			</div>
		</div>
	</div>

</div>