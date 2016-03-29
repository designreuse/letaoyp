<%@tag pageEncoding="UTF-8"%>
<%@ attribute name="page" type="org.springframework.data.domain.Page" required="true"%>
<%@ attribute name="paginationSize" type="java.lang.Integer" required="true"%>
<%@ attribute name="action" type="java.lang.String" required="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	int current = page.getNumber() + 1;
	int begin = Math.max(1, current - paginationSize / 2);
	int end = Math.min(begin + (paginationSize - 1), page.getTotalPages());

	request.setAttribute("current", current);
	request.setAttribute("begin", begin);
	request.setAttribute("end", end);
%>

<div class="box-footer clearfix">
	<div class="pull-right">
		<ul class="pagination pagination-sm no-margin">
			<li class="pull-left input-sm">共${page.totalPages}页， ${page.totalElements}条记录 </li>
			<%
				if (page.hasPreviousPage()) {
			%>
			<li><a href="${action}?page=1&sortType=${sortType}&${searchParams}" class="ajax_link">&laquo;</a></li>
			<%
				} else {
			%>
			<li class="disabled"><a href="javascript:;">&laquo;</a></li>
			<%
				}
			%>

			<c:forEach var="i" begin="${begin}" end="${end}">
				<c:choose>
					<c:when test="${i == current}">
						<li class="active"><a href="javascript:;">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${action}?page=${i}&sortType=${sortType}&${searchParams}" class="ajax_link">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<%
				if (page.hasNextPage()) {
			%>
			<li><a href="${action}?page=${page.totalPages}&sortType=${sortType}&${searchParams}" class="ajax_link">&raquo;</a></li>
			<%
				} else {
			%>
			<li class="disabled"><a href="javascript:;">&raquo;</a></li>
			<%
				}
			%>

		</ul>
	</div>
</div>

