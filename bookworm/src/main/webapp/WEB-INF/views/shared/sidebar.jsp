<p class="lead">Genres</p>
<div class="list-group">
	<c:forEach items="${genres}" var="genre">
		<a href="${contextRoot}/show/genre/${genre.id}/books" class="list-group-item" id="a_${genre.name}">${genre.name}</a>
	</c:forEach>
</div>