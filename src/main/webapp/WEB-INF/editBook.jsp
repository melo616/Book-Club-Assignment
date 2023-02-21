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
<title>Create Donation</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	 <h1>Edit Donation</h1>
 	<form:form action="/books/edit/${foundBook.id }" method="POST" modelAttribute="foundBook">
 	<input type="hidden" name="_method" value="put"/>
	 	<p>
	 		<form:label path="title">Title: </form:label>
	 		<form:input path="title"/>
	 		<form:errors path="title"/>
	 	</p>
	 	<p>
	 		<form:label path="author">Author: </form:label>
	 		<form:input path="author"/>
	 		<form:errors path="author"/>
	 	</p>
	 	<p>
	 		<form:label path="thoughts">My Thoughts: </form:label>
	 		<form:textarea path="thoughts"/>
	 		<form:errors path="thoughts"/>
	 	</p>
		<form:hidden path="reviewer" value="${foundBook.reviewer.id}"/>
		<!--above will work even if you remove value. reviewer id is included in foundDonation already. -->
	 	<button type="submit">Edit book</button>
	 	</form:form>
</body>
</html> 