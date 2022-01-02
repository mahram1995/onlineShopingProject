<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="../footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
	if (window.history.forward(1) != null)
		window.history.forword;
</script>
</head>
<body>
	<br>
	<table>
		<thead>
			<%
			String email = session.getAttribute("email").toString();
			int total = 0;
			int SL = 0;
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			try {
				ResultSet rs = st.executeQuery("select sum(total) from cart where email='" + email + "' and address is NULL");

				while (rs.next()) {
					total = rs.getInt(1);
				}
			%>

			<tr>
				<th scope="col"><a href="myCart.jsp"><i
						class='fas fa-arrow-circle-left'> Back</i></a></th>

			</tr>
		</thead>
		<thead>
			<tr>
				<th scope="col">S.No</th>
				<th scope="col">Product Name</th>
				<th scope="col">Category</th>
				<th scope="col"><i class="fa fa-inr"></i> price</th>
				<th scope="col">Quantity</th>
				<th scope="col">Sub Total</th>
			</tr>
		</thead>
		<tbody>
			<%
			ResultSet rs1 = st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"
					+ email + "' and cart.address is NULL");

			while (rs1.next()) {
			%>
			<tr>
				<%
				SL = SL + 1;
				%>
				<td><%=SL%></td>
				<td><%=rs1.getString(2)%></td>
				<td><%=rs1.getString(3)%></td>
				<td><i class="fa fa-inr"></i> <%=rs1.getString(4)%></td>
				<td><%=rs1.getString(8)%></td>
				<td><i class="fa fa-inr"></i> <%=rs1.getString(10)%></td>
			</tr>
			<%
			}
			%>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td style="font-size: 25px">Total</td>
				<td style="font-size: 25px"><u style="margin-top: 5px"><%=total%></u></td>
			</tr>
		</tbody>
	</table>

	<%
	ResultSet rs2 = st.executeQuery("select * from users where email='" + email + "'");
	rs2.next();
	%>
	<hr style="width: 100%">
	<form action="addressPaymentForOrderAction.jsp" method="post">
		<div class="left-div">
			<h3>Enter Address</h3>
			<input class="input-style" type="text" name="address"
				placeholder="Enter Address" value="<%=rs2.getString(7)%>" required>
		</div>

		<div class="right-div">
			<h3>Enter City</h3>
			<input class="input-style" type="text" name="city"
				placeholder="Enter City" value="<%=rs2.getString(8)%>" required>
		</div>

		<div class="left-div">
			<h3>Enter State</h3>
			<input class="input-style" type="text" name="state"
				placeholder="Enter satate" value="<%=rs2.getString(9)%>" required>
		</div>

		<div class="right-div">
			<h3>Enter Country</h3>
			<input class="input-style" type="text" name="country"
				laceholder="Enter Country" value="<%=rs2.getString(10)%>" required>

		</div>
		<hr style="width: 100%">
		<div class="left-div">
			<h3>Select way of Payment</h3>
			<select class="input-style" name="paymentMethod">
				<option value="Cash on delivery(COD)">Cash on delivery(COD)</option>
				<option value="Online Payment">Online Payment</option>
			</select>

		</div>

		<div class="right-div">
			<h3>Pay online on this btechdays@pay.com</h3>
			<input class="input-style" type="text" name="transactionId"
				placeholder="Enter transactionId">
			<h5>*If you select online Payment then enter
				you transaction ID here otherwise leave this blank</h5>
		</div>
		<hr style="width: 100%">

		<div class="left-div">
			<h3>Mobile Number</h3>
			<input class="input-style" type="text" name="mobileNumber"
				laceholder="Enter mobile number" value="<%=rs2.getString(3)%>" required>
			<h5 >*This mobile number will also updated to
				your profile</h5>
		</div>
		<div class="right-div">
			<h5>*If you enter wrong transaction id then
				your order will we can cancel!</h5>
			<button class="button" type="submit">Procced to Generate Bill & Save<i class='far fa-arrow-alt-circle-right'></i></button>
			<h5>*Fill form correctly</h5>
		</div>
	</form>
	<%
	} catch (Exception e) {
	System.out.print(e);
	}
	%>

	<br>
	<br>
	<br>

</body>
</html>