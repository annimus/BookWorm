<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- Flows Header -->
<%@include file="../shared/flows-header.jsp"%>

<div class="container">

	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Sign Up - Personal</h4>
				</div>

				<div class="panel-body">
					<sf:form method="POST" class="form-horizontal" id="registerForm" modelAttribute="user">
						<div class="form-group">
							<label class="control-label col-md-4" for="firstName">First Name:</label>
							<div class="col-md-8">
								<sf:input type="text" path="firstName" class="form-control"
									placeholder="First Name" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="lastName">Last Name:</label>
							<div class="col-md-8">
								<sf:input type="text" path="lastName" class="form-control"
									placeholder="Last Name" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="email">Email:</label>
							<div class="col-md-8">
								<sf:input type="text" path="email" class="form-control"
									placeholder="abc@xyz.com" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="contactNumber">Contact Number:</label>
							<div class="col-md-8">
								<sf:input type="text" path="contactNumber" class="form-control"
									placeholder="(XX) XXXXX-XXXX" maxlength="15" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="password">Password:</label>
							<div class="col-md-8">
								<sf:input type="password" path="password" class="form-control"
									placeholder="Password" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="role">Role:</label>
							<div class="col-md-8">
								<label class="radio-inline">
									<sf:radiobutton path="role" value="USER" checked="checked" /> User
								</label>
								
								<label class="radio-inline">
									<sf:radiobutton path="role" value="SUPPLIER" /> Supplier
								</label>
							</div>
						</div>
						
						<!-- Submits to billing -->
						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<button type="submit" class="btn btn-primary" name="_eventId_billing">
									Next - Billing <span class="glyphicon glyphicon-chevron-right"></span>
								</button>
							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>

</div>

<!-- Flows Footer -->
<%@include file="../shared/flows-footer.jsp"%>