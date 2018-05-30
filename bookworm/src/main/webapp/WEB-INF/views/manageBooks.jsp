<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">

		<c:if test="${not empty message}">
			<div class="col-xs-12">
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					${message}
				</div>
			</div>
		</c:if>
		<div class="col-md-offset-2 col-md-8">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>
						<font color="white">Book Management</font>
					</h4>
				</div>

				<div class="panel-body">

					<!-- Form Elements -->
					<sf:form class="form-horizontal" modelAttribute="book"
						action="${contextRoot}/manage/books" method="POST"
						enctype="multipart/form-data">
						<div class="form-group">
							<label class="control-label col-md-4" for="name">Enter
								Book Name:</label>

							<div class="col-md-8">
								<sf:input type="text" path="name" id="name"
									placeholder="Book Name" class="form-control" />
								<sf:errors path="name" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="author">Author
								Name:</label>

							<div class="col-md-8">
								<sf:input type="text" path="author" id="author"
									placeholder="Author Name" class="form-control" />
								<sf:errors path="author" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="publisher">Publisher
								Name:</label>

							<div class="col-md-8">
								<sf:input type="text" path="publisher" id="publisher"
									placeholder="Publisher Name" class="form-control" />
								<sf:errors path="publisher" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="description">Description:</label>

							<div class="col-md-8">
								<sf:textarea path="description" id="description" rows="4"
									placeholder="Write a small description of the book."
									class="form-control"></sf:textarea>
								<sf:errors path="description" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="unitPrice">Unit
								Price:</label>

							<div class="col-md-8">
								<sf:input type="number" path="unitPrice" id="unitPrice"
									placeholder="Unit Price in &#36;" class="form-control" min="0"
									step="0.01" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="quantity">Quantity:</label>

							<div class="col-md-8">
								<sf:input type="number" path="quantity" id="quantity"
									placeholder="Quantity" class="form-control" />
								<sf:errors path="quantity" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="isbn">I.S.B.N.:</label>

							<div class="col-md-8">
								<sf:input type="number" path="isbn" id="isbn"
									placeholder="I.S.B.N." class="form-control" />
								<sf:errors path="isbn" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="file">Select
								an Image</label>

							<div class="col-md-8">
								<sf:input type="file" path="file" id="file" class="form-control" />
								<sf:errors path="file" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="genreId">Select
								the Genre:</label>

							<div class="col-md-8">
								<sf:select class="form-control" id="genreId" path="genreId"
									items="${genres}" itemLabel="name" itemValue="id" />

								<c:if test="${book.id == 0}">
									<div class="text-right">
										<br />
										<button type="button" data-toggle="modal"
											data-target="#myGenreModal" class="btn btn-warning btn-xs">Add
											Genre</button>
									</div>
								</c:if>
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" name="submit" id="submit" value="Submit"
									class="btn btn-primary" />
							</div>
						</div>

						<!-- Hidden Fields -->
						<sf:hidden path="id" />
						<sf:hidden path="code" />
						<sf:hidden path="supplierId" />
						<sf:hidden path="active" />
						<sf:hidden path="purchases" />
						<sf:hidden path="views" />
						<sf:hidden path="isbn" />
						<sf:hidden path="rating" />
						<sf:hidden path="ratingCount" />
					</sf:form>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12">
			<h3>Available Books</h3>
			<hr />
		</div>

		<div class="col-xs-12">
			<div class="container-fluid">
				<div class="table-responsive">
					<table id="adminBooksTable"
						class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>&#160;</th>
								<th>Name</th>
								<th>Author</th>
								<th>Publisher</th>
								<th>Unit Price</th>
								<th>Quantity</th>
								<th>Active</th>
								<th>Edit</th>
							</tr>
						</thead>

						<tfoot>
							<tr>
								<th>Id</th>
								<th>&#160;</th>
								<th>Name</th>
								<th>Author</th>
								<th>Publisher</th>
								<th>Unit Price</th>
								<th>Quantity</th>
								<th>Active</th>
								<th>Edit</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<!-- Book Table for Admin -->

		</div>
	</div>

	<div class="modal fade" id="myGenreModal" role="dialog" tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>

					<h4 class="modal-title">Add New Genre</h4>
				</div>

				<!-- Modal Body -->
				<div class="modal-body">
					<!-- Genre Form -->
					<sf:form id="genreForm" modelAttribute="genre"
						action="${contextRoot}/manage/genre" method="POST"
						class="form-horizontal">

						<div class="form-group">
							<label for="genre_name" class="control-label col-md-4">Name:</label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="genre_name"
									class="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label for="genre_description" class="control-label col-md-4">Description:</label>
							<div class="col-md-8">
								<sf:textarea rows="5" path="description" id="genre_description"
									class="form-control" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" value="Add Genre" class="btn btn-primary" />
							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>

</div>