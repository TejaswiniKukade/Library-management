<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>

	<!-- without login we can not access the add_books.jsp  -->

	<%
	// Assuming userobj is a session attribute
	Object userobj1 = session.getAttribute("userobj");

	if (userobj1 == null) {
		response.sendRedirect("../login.jsp");
	}
	%>

	<!-- End -->
	
	<!-- NavBar Start -->
	<div class="container">
		<div class="row pt-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center ">Add Books</h4>

						<%
						// Retrieve registration message from session
						String registrationMessage = (String) session.getAttribute("succmsg");
						if (registrationMessage != null) {
						%>
						<p class="text-center text-success"><%=registrationMessage%></p>
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
						<p class="text-center text-danger"><%=errormsg%></p>
						<%
						// Remove the attribute from session to avoid displaying it again on refresh
						session.removeAttribute("failed");
						}
						%>

						<form action="../addbooks" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="bname">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="author">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="price">
							</div>
							<div class="form-group">
								<lable for="inputSate">Book Categories</lable>
								<select id="inputState" name="btype" class="form-control">

									<option selected>--select--</option>
									<option value="New">New Book</option>

								</select>
							</div>

							<div class="form-group">
								<lable for="inputSate">Book Status</lable>
								<select id="inputState" name="bstatus" class="form-control">

									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>

								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									type="file" class="form-control-file"
									id="exampleFormControlFile1" name="bimg">
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
</html>