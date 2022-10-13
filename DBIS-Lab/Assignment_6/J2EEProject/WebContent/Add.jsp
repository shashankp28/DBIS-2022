<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form to Add a Book</title>
</head>
<h3><a href="Home.jsp">Home</a></h3>
<body>
<h1>Book Details</h1>
<form action="AddServlet" method="post">
			<table style="with: 50%">
				<tr>
					<td>Book Id</td>
					<td><input type="number" name="id" required /></td>
				</tr>
				<tr>
					<td>Title</td>
					<td><input type="text" name="title" required /></td>
				</tr>
				<tr>
					<td>Category</td>
					<td><input type="text" name="category"/></td>
				</tr>
					<tr>
					<td>Author</td>
					<td><input type="text" name="author" required /></td>
				</tr>

			</table>
			<input type="submit" value="Submit" /></form>
</body>
</html>
