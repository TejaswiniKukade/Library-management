<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDetails"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row pt-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center ">Edit Books</h4>

						

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDetails b = dao.getBookById(id);
						%>

						<form action="../editbooks" method="post">
						
						<input type="hidden" name="id" value="<%=b.getBookid()%>">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="bname"
									value=<%=b.getBookname()%>>

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="author"
									value=<%=b.getAuthor()%>>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="price"
									value=<%=b.getPrice()%>>
							</div>


							<div class="form-group">
								<lable for="inputSate">Book Status</lable>
								<select id="inputState" name="bstatus" class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
                                    <option value="Inactive">Inactive</option>
									<option value="Active">Active</option>

									<%
									}
									%>

								</select>
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 50px;">
		<%@include file="footer.jsp"%>
	</div>
</body>