<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
	<div id='container'>
		<div class='signup'>
			<form action="fogotPasswordAction.jsp" method="post">
				<input type="email" name="email" placeholder="Enter your email"required="required" /> 
				<input type="number" name="mobileNumber"placeholder="Enter your mobile number" required="required" /> 
				<select name="securityQuestion">
					<option value="what is your first name">what is your first name</option>
					<option value="what is last six digit of our father mobile number">what is last six digit of our father mobile number</option>
					<option value="what is best friend name">what is best friend name</option>
				</select>
				<input type="text" name="answer" placeholder="Enter your answer"required="required" /> 
				<input type="password" name="newPassword" placeholder="Enter your new password"required="required" />
				<input type="submit" value="Save"  /> 
			</form>

			<h2>
				<a href="login.jsp">Login</a>
			</h2>
		</div>
		<div class='whyforgotPassword'>
           <%
           String msg=request.getParameter("msg");
           if("done".equals(msg)){
           %>
			<h1>Password Changed Successfully!</h1>
            <%} %>
            <%
            if("Invalid".equals(msg)){
            %>
			<h1>Some thing Went Wrong! Try Again !</h1>
            <%} %>
			<h2>Online Shopping</h2>
			<p>The Online Shopping System is the application that allows the
				users to shop online without going to the shops to buy them.</p>
		</div>
	</div>
</body>
</html>