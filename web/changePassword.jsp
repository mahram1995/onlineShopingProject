<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
    <head>
        <link rel="stylesheet" href="css/changeDetails.css.css">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <style>
            input{
                width: 100%;
                height: 35px;
                margin-top: 2px;
                padding-top: 2px;
                font-size: 15px;

            }
            h3{
                color: white;
                margin-bottom: 0px;

            }
            .buttons{
                text-align: center;
                font-size: 20px;
                height: 35px;
                width: 100%;
                background-color: #f5ce64;

            }
            .buttons:hover{
                background-color: #3CBC8D
            }
        </style>
    </head>
    <body>

        <div style="margin: auto;  width: 350px ; padding: 10px"> 
            <form action="changePasswordAction.jsp" method="post" >

                <h3>Enter Old Password! </h3>
                <input class="input-style" type="text" name="oldPassword" placeholder="Enter old password" required="" ><br>

                <h3>Enter New Password </h3>
                <input class="input-style" type="password" name="newPassword" placeholder="Enter new password" required="" ><br>

                <h3>Enter Confirm Password </h3>
                <input class="input-style" type="password" name="confirmPassword" placeholder="Enter confirm password" required="" ><br>
                <br>
                <button  class="buttons" type="submit">Save</button>

            </form>
           
        </div>
        <div style="text-align: center">
             <%          
                String msg = request.getParameter("msg");
                if ("notMatch".equals(msg)) {
            %>
            <h3 class="alert">New password and Confirm password does not match! </h3>
            <%}
                if ("wrong".equals(msg)) {
            %>
            <h3 class="alert">Your old Password is wrong! </h3>
            <%}
                if ("done".equals(msg)) {
            %>
            <h3 class="alert">Password change successfully! </h3>
            <%}
                if ("ivalid".equals(msg)) {
            %>
            <h3 class="alert">Some thing went wrong! Try again! </h3>
            <%}
            %>
        </div>
    </body>