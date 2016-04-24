<%@tag pageEncoding="UTF-8"%>
<%@ attribute name="page" type="org.springframework.data.domain.Page" required="true"%>
<%@ attribute name="paginationSize" type="java.lang.Integer" required="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
int current =  page.getNumber() + 1;
int begin = Math.max(1, current - paginationSize/2);
int end = Math.min(begin + (paginationSize - 1), page.getTotalPages());

request.setAttribute("current", current);
request.setAttribute("begin", begin);
request.setAttribute("end", end);
%>

<div id="pager" class="pagebar">
	<span class="f_l f6">总计 <b>${page.totalElements}</b> 个记录</span>
	<% if (page.hasPreviousPage()){%>
		<a href="?page=1&sortType=${sortType}&${searchParams}">第一页</a>
		<a class="?page=${current-1}&sortType=${sortType}&${searchParams}" href="">上一页</a>
	<%} %>
	
	<c:forEach var="i" begin="${begin}" end="${end}">
        <c:choose>
            <c:when test="${i == current}">
            	<span class="lis page_now">${i}</span>
            </c:when>
            <c:otherwise>
            	<a href="?page=${i}&sortType=${sortType}&${searchParams}" class="lis">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
	<% if (page.hasNextPage()){%>
		<a class="next" href="?page=${current+1}&sortType=${sortType}&${searchParams}">下一页</a>
		<a class="last" href="?page=${page.totalPages}&sortType=${sortType}&${searchParams}">最末页</a>
	<%} %>
</div>

