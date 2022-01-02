<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="css/home-style.css">
        <link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
        <br>
        <div class="topnav sticky" style="background-color: #f5ce64">
            
            <center>
                <h2>Dream Online Shopping</h2>
            </center>
            <h2>
            </h2>
            <a href="index.jsp">Home<i class="fa fa-institution"></i></a>    
            <a href="">About <i class="fa fa-address-book"></i></a>
            <a href="login.jsp">Login <i class='fas fa-share-square'></i></a>
            <div class="search-container">
                <form action="index.jsp" method="post">
                    <input type="text" placeholder="search" name="search">
                    <button type="submit" class="fa fa-search"></button>
                </form>

            </div>
        </div>
        <div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>

        <table>
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th style="width: 500px ; text-align: left" scope="col">Name</th>
                    <th scope="col">Category</th>
                    <th scope="col"><i class="fa "></i> Price</th>
                    <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
                </tr>
            </thead>
            <tbody>
                <%
                    int z = 0;
                    try {
                        
                        String search ="" ;       
                        search=request.getParameter("search");
                        String p=request.getParameter("search");
                        Connection con = ConnectionProvider.getCon();
                        Statement st = con.createStatement();
                       
                        //search data from database
                        ResultSet rs2 = st.executeQuery("select * from product where name like '%" + search + "%' or id like '%" + search + "%' or catagory like '%" + search + "%' and active='Yes'");
                       
                            while (rs2.next()) {
                                z=1;
                %>
                <tr>
                    <td><%=rs2.getString(1)%></td>
                    <td><%=rs2.getString(2)%></td>
                    <td><%=rs2.getString(3)%></td>
                    <td> &#2547; <%=rs2.getString(4)%> </td>
                    <td><a href="login.jsp?id=<%=rs2.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
                </tr>   

                <%}
                    
                   
          
            if(z==0)
                 {
                    ResultSet rs = st.executeQuery("select * from product where active='Yes'");
                    while (rs.next()) {


            %>
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><i class="fa "></i><%=rs.getString(4)%> </i></td>
                <td><a href="login.jsp?id=<%=rs.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
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