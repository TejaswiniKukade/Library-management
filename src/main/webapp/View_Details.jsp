<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDetails"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Details</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	
	<%
	int bid=Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
	BookDetails b=dao.getBookById(bid);
	%>
	
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">

				<img src="" style="height: 150px; width: 150px"><br>
				<h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookname() %></span></h4>
				<h4>Author Name: <span class="text-success"><%=b.getAuthor() %></span></h4>
				<h4>Category: <span class="text-success"><%=b.getBookCategory() %></span></h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2>Java Programming</h2>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>

					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>

					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>

					</div>

				</div>
				
				<div class="text-center p-3">
				<a href="" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
				<a href="" class="btn btn-danger"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
				</div>

			</div>

		</div>
	</div>

</body>
</html>