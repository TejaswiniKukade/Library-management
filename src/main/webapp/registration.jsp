<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook:Register</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Registration Page</h4>
						<div class="text-center text-primary">
						
						<!-- If Registartion is unsuccessfull below message is print -->
							<%
							// Retrieve registration message from session
							String registrationMessage = (String) session.getAttribute("message");
							if (registrationMessage != null) {
							%>
							<p><%=registrationMessage%></p>
							<%
							// Remove the attribute from session to avoid displaying it again on refresh
							session.removeAttribute("message");
							}
							%>
							
						</div>
						<form action="registration" method="post">
							<div class="form-group pt-1">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1" required="required"> <label
									class="form-check-label" for="exampleCheck1">Agree
									terms & Conditions</label>
							</div>

							<div class="text-center pt-2">
								<button type="submit" class="btn btn-primary ">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>