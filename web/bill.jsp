<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp"%>
<html>
    <head>
        <link rel="stylesheet" href="css/bill.css">
        <title>Bill</title>
        <style>

        </style>
    </head>
    <body>
        <%
            String email = session.getAttribute("email").toString();
            try {
                int total = 0;
                int SL = 0;
                Connection con = ConnectionProvider.getCon();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select sum(total) from cart where email='" + email + "' and status='bill'");
                while (rs.next()) {
                    total = rs.getInt(1);
                }

                ResultSet rs1 = st.executeQuery("select * from users inner join cart where cart.email='" + email + "' and cart.status='bill'");
                while (rs1.next()) {

        %>


        <h3>Online shopping Bill (BTech Days)</h3>
        <hr>
        <div class="left-div"><h3>Name: <%=rs1.getString(1)%> </h3></div>
        <div class="right-div-right"><h3>Email:   <%=email%></h3></div>
        <div class="right-div"><h3>Mobile Number: <%=rs1.getString(3)%>  </h3></div>  

        <div class="left-div"><h3>Order Date:   <%=rs1.getString(20)%></h3></div>
        <div class="right-div-right"><h3>Payment Method:  <%=rs1.getString(22)%> </h3></div>
        <div class="right-div"><h3>Expected Delivery:   <%=rs1.getString(21)%></h3></div> 

        <div class="left-div"><h3>Transaction Id:<%=rs1.getString(23)%></h3></div>
        <div class="right-div-right"><h3>City: <%=rs1.getString(8)%>  </h3></div> 
        <div class="right-div"><h3>Address:  <%=rs1.getString(7)%> </h3></div> 

        <div class="left-div"><h3>State:  <%=rs1.getString(9)%> </h3></div>
        <div class="right-div-right"><h3>Country:  <%=rs1.getString(10)%> </h3></div>  

        <hr>
        <%break;
    }%>


        <br>

        <table id="customers">
            <h3>Product Details</h3>
            <tr>
                <th style="text-align: center">S.No</th>
                <th style="text-align: center">Product Name</th>
                <th style="text-align: center">category</th>
                <th style="text-align: center">Price</th>
                <th style="text-align: center">Quantity</th>
                <th style="text-align: center">Sub Total</th>
            </tr>
            <%

                ResultSet rs5 = st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='" + email + "' and cart.status='bill'");
                while (rs5.next()) {
                    SL = SL + 1;

            %>
            <tr>
                <td style="text-align: center"><%=SL%></td>
                <td><%=rs5.getString(17)%></td>
                <td><%=rs5.getString(18)%></td>
                <td style="text-align: right">&#2547; <%=rs5.getString(19)%></td>
                <td style="text-align: center"><%=rs5.getString(3)%></td>
                <td style="text-align: right">&#2547; <%=rs5.getString(5)%></td>
            </tr>
            <tr>
                <%}%>
        </table>
        <h3>Total:&#2547; <%=total%> </h3>
        <a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
        <a onclick="window.print();"><button class="button right-button">Print</button></a>
        <br><br><br><br>
        <%} catch (Exception e) {
                System.out.print(e);
            }
        %>
    </body>
</html>