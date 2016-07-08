<%-- 
    Document   : resetmail
    Created on : 08.07.2016, 13:25:52
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
        <title>Reset mail</title>
    </head>
    <body>
        <h1>Reset mail</h1>
        <section>
            <form action="resetmail.jsp" method="post">
            <div>
                <p>New mail:</p>
                <input required type="mail" name="newmail" placeholder="ksinn@mail.ru">
            </div>
            <div>
                <p>Password:</p>
                <input required type="password" name="password" placeholder="*****">
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

        String password = request.getParameter("password");
        String newmail = request.getParameter("newmail");
        User user1 = (User) session.getAttribute("user");
        if(user1.ResetMail(newmail, password))
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
                            <form action="resetmail.jsp" method="post">
                            <div>
                                <p>New mail:</p>
                                <input required type="mail" name="newmail" placeholder="ksinn@mail.ru">
                            </div>
                            <div>
                                <p>Password:</p>
                                <input required type="password" name="password" placeholder="*****">
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

