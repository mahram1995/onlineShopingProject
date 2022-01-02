<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="../css/ordersReceived-style.css">
        <title>Home</title>
        <style>
            .th-style
            { width: 25%;}
            tr td{
                padding: 2px;
            }
        </style>
    </head>
    <body>
        <div style="color: white; text-align: center; font-size: 30px;">Delivered Orders <i class='fas fa-dolly'></i></div>

        <table id="customers">
            <tr>
                <th>Mobile Number</th>
                <th style="width: 200px" scope="col">Product Name</th>
                <th style="width: 90px"scope="col">Quantity</th>
                <th style="width: 80px" scope="col">Total</th>
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>Country</th>
                <th scope="col">Order Date</th>
                <th scope="col">Payment Method</th>
                <th scope="col">T-ID</th>
                <th style="width: 90px" scope="col">Status</th>
            </tr>


            <%
                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='Delivered'");
                    while (rs.next()) {
                        String[] orderDate = rs.getString(10).split(" ");
                        String[] deliveryDate = rs.getString(11).split(" ");
            %>
            <tr>
                <td><%=rs.getString(9)%></td>
                <td><%=rs.getString(17)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(5)%>  </td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
                <td><%=rs.getString(15)%></td>
                <td><%=rs.getString(8)%></td>
                <td><%=orderDate[0]%></td>
                <td><%=rs.getString(12)%></td>
                <td><%=rs.getString(13)%></td>
                <td><%=rs.getString(14)%></td>
            </tr>
            <%}
                } catch (Exception e) {
                    System.out.println(e);
                }

            %>

        </table>
        <br>
        <br>
        <br>

    </body>
</html>