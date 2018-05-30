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
						<font color="white">Genre Management</font>
					</h4>
				</div>

				<div class="panel-body">
					<sf:form class="form-horizontal" modelAttribute="nGenre"
						action="${contextRoot}/manage/genres" method="POST">
						<div class="form-group">
							<label class="control-label col-md-4" for="name">Genre
								Name: </label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="name"
									placeholder="Genre Name" class="form-control" />
								<sf:errors path="name" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="description">Genre
								Description: </label>
							<div class="col-md-8">
								<sf:textarea path="description" id="description" rows="4"
									placeholder="Write a small description for the genre here!"
									class="form-control" />

								<sf:errors path="description" cssClass="help-block" element="em" />
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
						<sf:hidden path="active" />
					</sf:form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-xs-12">
			<h3>Available Genres</h3>
		</div>
		
		<div class="col-xs-12">
			<div style="overflow:auto">
				<!-- Genres table for Admin -->
				<table id="adminGenresTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Description</th>
							<th>Active</th>
							<th>Edit</th>
						</tr>
					</thead>
					
					<tfoot>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Description</th>
							<th>Active</th>
							<th>Edit</th>
						</tr>
					</tfoot>
				</table>
				
			</div>
		</div>
	</div>
</div>