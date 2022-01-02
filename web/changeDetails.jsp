<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="css/changeDetails.css">
        <title>Change Details</title>
        <style>
            hr
            {width:70%;}
            tr td{
                text-align: left
            }
        </style>
    </head>
    <body>
        <%    try {
                Connection con = ConnectionProvider.getCon();
                Statement st = con.createStatement();
                ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
                while(rs.next()){
            
        %>
        <br>
        <table  style="width: 500px; margin-left: auto; margin-right: auto">
            
            <tbody>
                <tr>
                    <td>Name</td>
                    <td style="width: 5px">:</td>
                    <td><%=rs.getString(1)%></td>
                </tr>
                <tr>
                    <td>Email</td>
                     <td>:</td>
                    <td><%=rs.getString(2)%></td>
                </tr>
                <tr>
                    <td>Mobile Number</td>
                     <td>:</td>
                    <td><%=rs.getString(3)%></td>
                </tr>
                <tr>
                    <td>Security Question</td>
                     <td>:</td>
                    <td><%=rs.getString(4)%></td>
                </tr>
            </tbody>
        </table>
        <hr>
        <br>
        <br>
        <br>
   <%}
}
catch(Exception e){

System.out.println(e);
}
   %>
    </body>
</html>