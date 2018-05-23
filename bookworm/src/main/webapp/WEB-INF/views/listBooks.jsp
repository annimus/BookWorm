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
						<script>
							window.genreId = '';
						</script>

						<ol class="breadcrumb">

							<li><a href="${contextRoot}/home">Home</a></li>
							<li class="active">All Books</li>


						</ol>
					</c:if>

					<!-- Books by genre -->
					<c:if test="${userClickGenreBooks == true}">
						<script>
							window.genreId = '${genre.id}';
						</script>
						<ol class="breadcrumb">

							<li><a href="${contextRoot}/home">Home</a></li>
							<li><a href="${contextRoot}/show/all/books">All Books</a></li>
							<li class="active">${genre.name}</li>


						</ol>
					</c:if>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-12">
					<div class="container-fluid">
						<div class="table-responsive">
							<table id="bookListTable"
								class="table table-striped table-borderd">
								<thead>
									<tr>
										<th></th>
										<th>Name</th>
										<th>Author</th>
										<th>Price</th>
										<th>Available</th>
										<th></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th></th>
										<th>Name</th>
										<th>Author</th>
										<th>Price</th>
										<th>Available</th>
										<th></th>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>