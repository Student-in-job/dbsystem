<%-- 
    Document   : resetpasswd
    Created on : 08.07.2016, 12:35:25
    Author     : ksinn
--%>

<%@page import="Learning.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
User user = (User) session.getAttribute("user");
if(user!=null&&user.isLogined()){
if(request.getMethod()=="GET"){
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset password</title>
    </head>
    <body>
        <h1>Reset password</h1>
        <section>
            <form action="resetpasswd.jsp" method="post">
            <div>
                <p>Old Password:</p>
                <input required type="password" name="oldpassword" placeholder="*****">
            </div>
            <div>
                <p>New Password:</p>
                <input required type="password" name="newpassword" placeholder="*****">
            </div>
            <input type="submit">
            </form>
        </section>
    </body>
</html>
<%
}
else
    if(request.getMethod()=="POST"){

        String oldpassword = request.getParameter("oldpassword");
        String newpassword = request.getParameter("newpassword");
        User user1 = (User) session.getAttribute("user");
        if(user1.ResetPassword(oldpassword, newpassword))
        {
            response.sendRedirect("index.jsp");
            
        }
        else{
%>
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>Reset password</title>
                    </head>
                    <body>
                        <h1>Reset password</h1>
                        <h2 style="color: red;">Error error error</h2>
                        <section>
                            <form action="resetpasswd.jsp" method="post">
                            <div>
                                <p>Old Password:</p>
                                <input required type="password" name="oldpassword" placeholder="*****">
                            </div>
                            <div>
                                <p>New Password:</p>
                                <input required type="password" name="newpassword" placeholder="*****">
                            </div>
                            <input type="submit">
                            </form>
                                    </section>
                                </body>
                            </html>
<%
        }
    }
}
else{
  response.sendRedirect("index.jsp");  
}
    
%>
