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
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/book.jpg");
	height: 65vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img">
		<h2 class=" text-white">
			<i class="fa-solid fa-book"></i> EBook Management System
		</h2>
	</div>

	<!-- start recent book -->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getRecentBook();
			for (BookDetails b2 : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="java Book" src="book/<%=b2.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
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
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- End Recent book -->
	<hr>

	<!-- start New book -->

	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list = dao.getNewBook();
			for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="java Book" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2">Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Detail</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign"></i></a>


						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="all_new_books.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- End New book -->
	<hr>

	<!-- start Old book -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list3 = dao3.getOldBook();
			for (BookDetails b3 : list3) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="java Book" src="book/<%=b3.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b3.getBookname()%></p>
						<p><%=b3.getAuthor()%></p>
						<p>
							Categories:<%=b3.getBookCategory()%></p>
						<div class="row">

							<a href="" class="btn btn-success btn-sm ml-5">View Detail</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b3.getPrice()%></a>


						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_old_books.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- End Old book -->

	<%@include file="all_component/footer.jsp"%>

</body>
</html>