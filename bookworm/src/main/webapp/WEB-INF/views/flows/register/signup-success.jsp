<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- Flows Header -->
<%@include file="../shared/flows-header.jsp"%>

<div class="container">

	<div class="row">
		<div class="col-sm-offset-4 col-sm-4">
			<div class="text-center">
				<h1>Welcome!</h1>
				<h5>You can login using your email address and password!</h5>
				<div>
					<a href="${contextRoot}/login" class="btn btn-lg btn-success">Login Here</a>
				</div>
			</div>
		</div>
	</div>

</div>

<!-- Flows Footer -->
<%@include file="../shared/flows-footer.jsp"%>