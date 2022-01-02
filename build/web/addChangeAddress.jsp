<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or Change Address</title>
<style>
h3 {
	margin-bottom: 0px;
	text-align: left
}

input {
	width: 100%;
	height: 35px;
	font-size: 15px;
}
</style>
</head>
<body>
	<div style="width: 400px; margin: auto;">
		<%  String msg = request.getParameter("msg");
                if ("valid".equals(msg)) {
            %>
		<h3 class="alert">Address Successfully Updated !</h3>
		<%}
                if ("invalid".equals(msg)) {
            %>
		<h3 class="alert">Some thing Went Wrong! Try Again!</h3>

		<%}

                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from users where email='" + email + "'");
                    while (rs.next()) {


            %>
		<form action="cahngeAddressAction.jsp" method="post">
			<h3>Enter Address</h3>
			<input type="text" name="address" value="<%=rs.getString(7)%>"
				required="">

			<h3>Enter city</h3>
			<input type="text" name="city" value="<%=rs.getString(8)%>"
				required="">

			<h3>Enter State</h3>
			<input type="text" name="state" value="<%=rs.getString(9)%>"
				required="">

			<h3>Enter country</h3>
			<input type="text" name="country" value="<%=rs.getString(10)%>"
				required="">

			<button class="button" style="width: 140px" type="submit">
				<i class='far fa-arrow-alt-circle-right'></i> Save
			</button>
			<%        }
                        } catch (Exception e) {
                            System.out.println(e);

                        }
                    %>
		</form>
	</div>
</body>
<br>
<br>
<br>
</html>