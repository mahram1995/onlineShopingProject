<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/signup-style.css">
        <title>Signup</title>
    </head>
    <body>
        <div id='container'>
            <div class='signup'>
                <form action="signupAction.jsp" method="post">
                    <input type="text" name="name" placeholder="Enter name" required="required" /> 
                    <input type="text" name="email" placeholder="Enter email" required="required" /> 
                    <input type="text" name="mobileNumber" placeholder="Enter mobile number"     required="required" /> 
                    <select name="securityQuestion">
                        <option>what is your first name</option>
                        <option>what is last six digit of our father mobile number</option>
                        <option>what is best friend name</option>
                    </select>
                    <input type="text" name="answer" placeholder="Enter your answer"   required="required" />
                    <input type="password" name="password"  placeholder="Enter password" required="required" />
                    <input type="submit" value="signup" />
                </form>
                <h2>
                    <a href="login.jsp">Login</a>
                </h2>
            </div>
            <div class='whysign'>
                <%
                    String msg = request.getParameter("msg");
                    if ("valid".equals(msg)) {
                %>
                <h1>Successfully registered !</h1>
                <%}%>
                <%
                    if ("invalid".equals(msg)) {
                %>
                <h1>Some thing went wrong !try again !</h1>
                <%}%>

                <h2>Online Shopping</h2>
                <p>The Online Shopping System is the application that allows the
                    users to shop online without going to the shops to buy them.</p>
            </div>
        </div>

    </body>
</html>