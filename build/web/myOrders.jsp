<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
tr td, th {
	border: 1px solid #ccc;
}
</style>
</head>
<body>
	<div style="color: white; text-align: center; font-size: 30px;">
		My Orders <i class='fab fa-elementor'></i>
	</div>
	<table style="border: 1px solid buttonhighlight">
		<thead>

			<tr>
				<th style="width: 50px" scope="col">S.No</th>
				<th style="width: 200px" scope="col">Product Name</th>
				<th style="width: 100px" scope="col">category</th>
				<th style="width: 100px" scope="col">Price</th>
				<th style="width: 80px" scope="col">Quantity</th>
				<th style="width: 100px" scope="col">Sub Total</th>
				<th style="width: 120px" scope="col">Order Date</th>
				<th style="width: 120px" scope="col">Expected Delivery Date</th>
				<th style="width: 160px" scope="col">Payment Method</th>
				<th style="width: 100px" scope="col">Status</th>

			</tr>
		</thead>
		<tbody>
			<%  
                    int SL = 0;
                    try {
                       
                       
                        Connection con = ConnectionProvider.getCon();
                        Statement st = con.createStatement();
                        ResultSet rs1 = st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='" + email + "' and cart.orderDate is not null");
                        while (rs1.next()) {
                            SL = SL + 1;
                     String[] orderDate=rs1.getString(10).split(" ");
                     String[] deliveryDate=rs1.getString(11).split(" ");
                     double total=Double.parseDouble(rs1.getString(5));
                     String ss=String.format("%.2f",total);
                %>
			<tr>
				<td><%=SL%></td>
				<td><%=rs1.getString(17)%></td>
				<td><%=rs1.getString(18)%></td>
				<td>&#2547; <%=rs1.getString(4)%>
				</td>
				<td><%=rs1.getString(3)%></td>
				<td style="text-align: right">&#2547; <%=ss%>
				</td>
				<td><%=orderDate[0]%></td>
				<td><%=deliveryDate[0]%></td>
				<td><%=rs1.getString(12)%></td>
				<td><%=rs1.getString(14)%></td>
			</tr>

			<%}
                    } catch (Exception e) {
                        System.out.print(e);
                    }
                %>
		</tbody>
	</table>
	<br>
	<br>
	<br>

</body>
</html>