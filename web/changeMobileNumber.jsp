<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
    <head>
        <link rel="stylesheet" href="css/changeDetails.css">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <title>Message Us</title>
        <style>
            h3{
                text-align: left;
                margin-bottom: 2px;
            }
            input, select{
                width: 100%;
                height: 35px;
                font-size: 15px;

            }
            .buttons{
                margin-top: 25px;
                width:140px;
                height:40px;
                border-radius: 5px;
                background-color: #53CACE;


            }
            .buttons:hover{
                background-color: #f5ce64;
            }
        </style>
    </head>
    <body>

        <div style="width:400px; margin: auto;text-align: center" > 
            <form action="changeMobileNumberAction.jsp" method="post"> 
                <h3>Enter Your New Mobile Number</h3>
                <input  type="text" name="mobileNumber" placeholder="Enter your new mobile " required="">

                <h3>Enter Password (For Security)</h3>
                <input type="password" name="password" placeholder="Enter password for security" required="">

                <button class="buttons" style="width: 140px" type="submit"> Save</button> 
            </form>
            <%  String msg = request.getParameter("msg");
                if ("done".equals(msg)) {
            %>
            <h2 class="alert">Your Mobile Number successfully changed!</h2>
            <%}
                if ("error".equals(msg)) {
            %>
            <h2 class="alert">Your Password is wrong!</h2>
            <%}
            %>
        </div>
    </body>
    <br><br><br>
</html>