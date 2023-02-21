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
<h1>Add a Book to Your Shelf!</h1>
	 <div class="container mt-5">
 	<form:form action="/books/new" method="POST" modelAttribute="newBook">
	 	<p>
	 		<form:label path="title">Title: </form:label>
	 		<form:input path="title" class="form-control"/>
	 		<form:errors path="title"/>
	 	</p>
	 	<p>
	 		<form:label path="author">Author: </form:label>
	 		<form:input path="author" class="form-control"/>
	 		<form:errors path="author"/>
	 	</p>
	 	<p>
	 		<form:label path="thoughts">My Thoughts: </form:label>
	 		<form:textarea path="thoughts" class="form-control"/>
	 		<form:errors path="thoughts"/>
	 	</p>
	 	<p>
			<form:hidden path="reviewer" value="${userId }"/>
	 	</p>
	 	<button type="submit">Submit</button>
	 	</form:form>
	 	</div>
</body>
</html>