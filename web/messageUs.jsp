<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
    <head>
        <link rel="stylesheet" href="css/messageUs.css">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <title>Message Us</title>
        <style>
            .buttons{
                margin-top: 25px;
                width:140px;
                height:40px;
                border-radius: 5px;
                background-color: #53CACE;
                margin-left:45%


            }
            .buttons:hover{
                background-color: #f5ce64;
            }
        </style>
    </head>
    <body>

        <form action="messageUsAction.jsp" method="post">
            <input class="input-style" type="text" name="subject" placeholder="Subject" required="">
            <hr>
            <textarea class="input-style" name="body" placeholder="Enter your message" required=""></textarea>
            <hr>
            <button class="buttons" type="submit" >Send</button>
        </form>
        <%  String msg = request.getParameter("msg");
            if ("done".equals(msg)) {
        %>
        <h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
        <%}
            if ("error".equals(msg)) {
        %>
        <h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
        <%}
        %>
        <br><br><br>
    </body>
</html>