<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
<style>
h3 {
	text-align: left;
	margin-bottom: 2px;
}

input, select {
	width: 100%;
	height: 35px;
	font-size: 15px;
}
</style>
</head>
<body>
	<div style="width: 400px; margin: auto">
		<form action="changeSecurityQuestionAction.jsp" method="post">
			<h3>Select Your New Security Question</h3>
			<select name="securityQuestion">
				<option class="" value="what is your first name">what is
					your first name</option>
				<option value="what is last six digit of our father mobile number">what
					is last six digit of our father mobile number</option>
				<option value="what is best friend name">what is best
					friend name</option>
			</select>

			<h3>Enter Your New Answer</h3>
			<input type="text" name="newAnswer"
				placeholder="Enter your new answer" required="">

			<h3>Enter Password (For Security)</h3>
			<input type="password" name="password"
				placeholder="Enter password for security" required="">

			<button class="button" style="width: 140px" type="submit">
				<i class='far fa-arrow-alt-circle-right'></i> Save
			</button>
		</form>
		<%  String msg = request.getParameter("msg");
                if ("valid".equals(msg)) {
            %>
		<h3 class="alert">Your security Question successfully changed !</h3>
		<%}
                if ("invalid".equals(msg)) {
            %>
		<h3 class="alert">Your Password is wrong!</h3>
		<%}

            %>
	</div>
</body>

<br>
<br>
<br>
</html>