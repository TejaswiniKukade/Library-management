<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDetails"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<!-- without login we can not access the all_books.jsp  -->

	<%
	// Assuming userobj is a session attribute
	Object userobj1 = session.getAttribute("userobj");

	if (userobj1 == null) {
		response.sendRedirect("../login.jsp");
	}
	%>

	<!-- End -->
	<h3 class="text-center">Hello,admin</h3>

	<%
	// Retrieve registration message from session
	String registrationMessage = (String) session.getAttribute("succmsg");
	if (registrationMessage != null) {
	%>
	<h5 class="text-center text-success"><%=registrationMessage%></h5>
	<%
	// Remove the attribute from session to avoid displaying it again on refresh
	session.removeAttribute("succmsg");
	}
	%>

	<%
	// Retrieve registration message from session
	String errormsg = (String) session.getAttribute("failed");
	if (errormsg != null) {
	%>
	<h5 class="text-center text-danger"><%=errormsg%></h5>
	<%
	// Remove the attribute from session to avoid displaying it again on refresh
	session.removeAttribute("failed");
	}
	%>


	<table class="table table-striped ">
		<thead class="bg-secondary text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Book Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

			List<BookDetails> list = dao.getAllBooks();

			for (BookDetails b : list) {
			%>
			<tr>
				<td><%=b.getBookid()%></td>
				<td><img src="../book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_books.jsp?id=<%=b.getBookid()%>"
					class="btn btn-sm btn-primary"><i
						class="fa-solid fa-pen-to-square"></i> Edit</a> <a
					href="../delete?id=<%=b.getBookid()%>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i>
						Delete</a></td>
			</tr>

			<%
			}
			%>



		</tbody>
	</table>

	<div style="margin-top: 200px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>