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
						action="${contextRoot}/manage/books" method="POST">
						<div class="form-group">
							<label class="control-label col-md-4" for="name">Enter
								Book Name:</label>

							<div class="col-md-8">
								<sf:input type="text" path="name" id="name"
									placeholder="Book Name" class="form-control" required="required"/>
								<em class="help-block">Please enter the book name!</em>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="author">Author
								Name:</label>

							<div class="col-md-8">
								<sf:input type="text" path="author" id="author"
									placeholder="Author Name" class="form-control" required="required"/>
								<em class="help-block">Please enter the author name!</em>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="publisher">Publisher
								Name:</label>

							<div class="col-md-8">
								<sf:input type="text" path="publisher" id="publisher"
									placeholder="Publisher Name" class="form-control" required="required"/>
								<em class="help-block">Please enter the publisher name!</em>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="description">Description:</label>

							<div class="col-md-8">
								<sf:textarea path="description" id="description" rows="4"
									placeholder="Write a small description of the book."
									class="form-control" required="required"></sf:textarea>
								<em class="help-block">Please enter the description!</em>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="unitPrice">Unit
								Price:</label>

							<div class="col-md-8">
								<sf:input type="number" path="unitPrice" id="unitPrice"
									placeholder="Unit Price in &#36" class="form-control" min="0" step="0.01" required="required"/>
								<em class="help-block">Please enter the unit price in &#36;!</em>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="quantity">Quantity:</label>

							<div class="col-md-8">
								<sf:input type="number" path="quantity" id="quantity"
									placeholder="Quantity" class="form-control" required="required"/>
								<em class="help-block">Please enter the quantity!</em>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="isbn">I.S.B.N.:</label>

							<div class="col-md-8">
								<sf:input type="number" path="isbn" id="isbn"
									placeholder="I.S.B.N." class="form-control" required="required"/>
								<em class="help-block">Please enter the I.S.B.N.!</em>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="genreId">Select
								the Genre:</label>

							<div class="col-md-8">
								<sf:select class="form-control" id="genreId" path="genreId"
									items="${genres}" itemLabel="name" itemValue="id" />
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
					</sf:form>
				</div>
			</div>
		</div>
	</div>
</div>