<p class="lead">BookWorm</p>
<div class="list-group">
	<c:forEach items="${genres}" var="genre">
		<a href="#" class="list-group-item">${genre.name}</a>
	</c:forEach>
</div>