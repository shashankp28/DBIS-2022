<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form to Issue a Book</title>
</head>
<h3><a href="Home.jsp">Home</a></h3>
<body>
<h1>Issuing Details</h1>
<form action="IssueServlet" method="post">
			<table style="with: 50%">
				<tr>
					<td>Student Id</td>
					<td><input type="number" name="s_id" /></td>
				</tr>
				<tr>
					<td>Book Id</td>
					<td><input type="number" name="b_id" /></td>
				</tr>
				<tr>
					<td>Issue Date</td>
					<td><input type="date" name="issue_date" /></td>
				</tr>
					<tr>
					<td>Return Date</td>
					<td><input type="date" name="return_date" /></td>
				</tr>

			</table>
			<input type="submit" value="Submit" /></form>
</body>
</html>
