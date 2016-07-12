<%-- 
    Document   : authorization
    Created on : 07.07.2016, 16:32:34
    Author     : ksinn
--%>

<%@page import="Learning.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(request.getMethod()=="GET"){
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Autorization</title>
    </head>
    <body>
        <h1>Log in</h1>
        <section>
            <form action="login.jsp" method="post">
                <div>
                <p>e-mail:</p>
                <input required type="mail" name="mail" value="ksinn@mail.ru">
            </div>
            <div>
                <p>Password:</p>
                <input required type="password" name="password" value="qwerty">
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

        String mail = request.getParameter("mail");
        String password = request.getParameter("password");
        User user = User.Authorize(mail, password);
        if(user!=null)
        {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("index.jsp");
            
        }
        else{
%>
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>Log in</title>
                </head>
                <body>
                    <h1>Log in</h1>
                    <h2 style="color: red;">Error error error</h2>
                    <section>
                        <form action="login.jsp" method="post">
                            <div>
                            <p>e-mail:</p>
                            <input required type="mail" name="mail" value="<%=mail%>">
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
    
%>