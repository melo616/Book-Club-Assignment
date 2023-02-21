<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="d-flex justify-content-between align-items-center p-3">
		<h1>Welcome, <c:out value="${userName }"/>!</h1>
		<div>
			<p><a href="/logout">Logout</a></p>
			<p><a href="/books/new">Add a book to your shelf</a></p>
		</div>
	</div>
	<div class="p-3">
		<p>Books from everyone's shelves:</p>
		<table class="table">
		<thead>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Author Name</th>
				<th>Posted By</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="oneBook" items="${ bookList}">
			<tr>
				<td>${oneBook.id }</td>
				<td><a href="/books/${oneBook.id }"><c:out value="${ oneBook.title}"/></a></td>
				<td><c:out value="${ oneBook.author}"/></td>
				<td><c:out value="${ oneBook.reviewer.userName}"/></td>
				<td><c:out value="${ oneDonation.description}"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>