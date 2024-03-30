<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook:Login</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row pt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Login</h3>

						<!-- Login Else part-->

						<%
						String error = request.getParameter("error");
						if (error != null && error.equals("invalid")) {
						%>
						<p style="color: red;">Invalid username or password</p>
						<%
						}
						%>

						<!-- If Registration successfull the below msg is print -->

						<%
						// Retrieve registration message from session
						String registrationMessage = (String) session.getAttribute("msg");
						if (registrationMessage != null) {
						%>
						<p class="text-center text-success"><%=registrationMessage%></p>
						<%
						// Remove the attribute from session to avoid displaying it again on refresh
						session.removeAttribute("msg");
						}
						%>
						
						<!-- Logout Message -->
						
						<%
						// Retrieve registration message from session
						String logoutMessage = (String) session.getAttribute("succMsg");
						if (logoutMessage != null) {
						%>
						<h5 class="text-center text-success"><%=logoutMessage%></h5>
						<%
						// Remove the attribute from session to avoid displaying it again on refresh
						session.removeAttribute("succMsg");
						}
						%>



						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br> <a href="registration.jsp">Create Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top:125px;">
	<%@include file="all_component/footer.jsp"%>
	</div>
	
</body>
</html>