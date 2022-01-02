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
                
                font-size: 13px;
            }
            tr th{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div style="color: white; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>
            <%
                String msg = request.getParameter("msg");
                if ("cencel".equals(msg)) {
            %>
        <h3 class="alert">Order Cancel Successfully!</h3>
        <%}
            if ("delivered".equals(msg)) {
        %>
        <h3 class="alert">Successfully Updated!</h3>
        <%}
            if ("error".equals(msg)) {
        %>
        <h3 class="alert">Some thing went wrong! Try Again!</h3>
        <%
            }
        %>

        <table id="customers" style="padding: 2px;">
            <tr>
                <th>Mobile Number</th>
                <th style="width: 150px" scope="col">Product Name</th>
                <th style="width: 35px"scope="col">QT</th>
                <th style="width: 60px" scope="col">  Total</th>
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>Country</th>
                <th scope="col">Order Date</th>
                <th scope="col">Expected Delivery Date</th>
                <th scope="col">Payment Method</th>
                <th scope="col">T-ID</th>
                <th style="width: 75px" scope="col">Status</th>
                <th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
                <th scope="col">Order Delivered <i class='fas fa-dolly'></i></i></th>
            </tr>
            <%
                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='processing'");
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
                <td><%=deliveryDate[0]%></td>
                <td><%=rs.getString(12)%></td>
                <td><%=rs.getString(13)%></td>
                <td><%=rs.getString(14)%></td>
                <td><a href="cancelOrderAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Cancel <i class='fas fa-window-close'></i></a></td>
                <td><a href="orderDeliveredAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Delivered <i class='fas fa-dolly'></i></i></a></td>
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