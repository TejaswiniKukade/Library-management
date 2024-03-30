<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All New Book</title>
<%@include file="all_component/allCss.jsp"%>

<style>

.crd-ho:hover {
	background-color: #fcf7f7;
}

</style>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
<div class="container-fluid">

		<div class="row p-3">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getAllNewBook();
			for (BookDetails b2 : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="java Book" src="book/<%=b2.getPhotoName()%>"
							style="width: 100px; height: 150px;" class="img-thumblin">
						<p><%=b2.getBookname()%></p>
						<p><%=b2.getAuthor()%></p>
						<p>

							<%
							if (b2.getBookCategory().equals("old")) {
							%>
							Categories:
							<%=b2.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-5">View Detail</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b2.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

						<%
						} else {
						%>

						Categories:
						<%=b2.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2">Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Detail</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b2.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

						<%
						}
						%>


					</div>
				</div>
			</div>

			<%
			}
			%>


       </div>

		</div>
</body>
</html>