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
<title>Book Details</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
	<h2><c:out value="${book.title }"/></h2>
	<p><c:out value="${book.reviewer.userName }"/> read <c:out value="${book.title }"/> by <c:out value="${book.author }"/></p>
	<p>Here are <c:out value="${book.reviewer.userName }"/>'s thoughts.</p>
	<hr>
	<p><c:out value="${book.thoughts }"/></p>
	<hr>
	<c:choose>
		<c:when test="${book.reviewer.id.equals(userId) }">
			<div class="d-flex gap-2">
			<a href="/books/edit/${book.id}" class="btn btn-primary">Edit</a>
			<form method="POST" action="/books/delete/${book.id }">
			<input type="hidden" name="_method" value="delete"/>
			<button class="btn btn-danger" type="submit">Delete</button>
			</form>
			</div>
		</c:when>
	</c:choose>
	<a href="/home">Go back</a>
</div>
</body>
</html>