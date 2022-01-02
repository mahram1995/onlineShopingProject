<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Home</title>
        <style>
            h3
            {
                color: yellow;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div style="color: white; padding-buttom: 20px; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
            <%    String msg = request.getParameter("msg");
                if ("added".equals(msg)) {
            %>
        <h3 class="alert">Product added successfully!</h3>
        <%} %>
        <%
            if ("exist".equals(msg)) {
        %>
        <h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
        <%} %>

        <%
            if ("invalid".equals(msg)) {
        %>
        <h3 class="alert">Some thing went wrong! Try Again!</h3>
        <%} %>
        <table>
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Category</th>
                    <th scope="col"><i class="fa "></i> Price</th>
                    <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
                </tr>
            </thead>
            <tbody>
                <%
                    int z = 0;
                    try {

                        String search = request.getParameter("search");
                        Connection con = ConnectionProvider.getCon();
                        Statement st = con.createStatement();

                        ResultSet rs2 = st.executeQuery("select * from product where name like '%" + search + "%' or id like '%" + search + "%' or catagory like '%" + search + "%' and active='Yes'");
                        if (rs2.isBeforeFirst()) {
                            while (rs2.next()) {
                                z = 1;
                %>
                <tr>
                    <td><%=rs2.getString(1)%></td>
                    <td><%=rs2.getString(2)%></td>
                    <td><%=rs2.getString(3)%></td>
                    <td><i class="fa "></i><%=rs2.getString(4)%> </i></td>
                    <td><a href="addToCartAction.jsp?id=<%=rs2.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
                </tr>   

                <%}
                } else if(rs2.isFirst()) {
                  z=1;
                %>
            <h3>No Data Found</h3>
            <%}

                if (z == 0) {
                    ResultSet rs = st.executeQuery("select * from product where active='Yes'");
                    while (rs.next()) {


            %>
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><i class="fa "></i><%=rs.getString(4)%> </i></td>
                <td><a href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
            </tr>
            <%}
                    }
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