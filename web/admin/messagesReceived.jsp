<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
            tr td{
                padding: 5px
            }
        </style>
    </head>
    <body>
        <div style="color: white; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
        <table border="1">
            <thead>
                <tr>
                    <th style="width: 50px" scope="col">ID</th>
                    <th style="width: 200px" scope="col">Email</th>
                    <th style="width: 300px" scope="col">Subject</th>
                    <th   scope="col">Body</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Connection con = ConnectionProvider.getCon();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from message");
                        while (rs.next()) {
                %>
                <tr>
                    <td ><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td style="text-align: left"><%=rs.getString(3)%></td>
                    <td style="text-align: justify"><%=rs.getString(4)%></td>
                </tr>
                <%}
                    } catch (Exception e) {
                        System.out.println(e);
                    }

                %>
            </tbody>
        </table>
        <br>
        <br>
        <br>

    </body>
</html>