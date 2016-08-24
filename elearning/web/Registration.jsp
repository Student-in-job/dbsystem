<%-- 
    Document   : Registration
    Created on : Aug 23, 2016, 4:57:22 PM
    Author     : javlonboy
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="DataBasePak.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getMethod() == "GET") {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="css/kube.min.css">

        <link rel="stylesheet" href="css/kube-ext.css">
        <link rel="stylesheet" href="css/master.css">

    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="row centered registration">
            <div class="col col-4">

                <form action="Registration.jsp" method="post" class="form">
                    <h3 class="text-centered">REGISTRATION</h3>

                    <div class="form-item">
                        <label>Email</label>
                        <input class="width-100" type="email" name="mail"  placeholder="example@mail.com" required>
                    </div>

                    <div class="form-item">
                        <label>Password</label>
                        <input class="width-100" type="password" name="password" required >
                    </div>

                    <div class="form-item">
                        <label>Password Confirm</label>
                        <input class="width-100" name="password_confirm" type="password" required>
                    </div>

                    <div class="form-item">
                        <label>Name</label>
                        <input class="width-100" name="name" type="text" required>
                    </div>

                    <div class="form-item">
                        <label>Surname</label>
                        <input class="width-100" name="surname" type="text" required>
                    </div>

                    <div class="form-item">
                        <label>Gender</label>
                        <select name="gender" required>
                            <option selected value="m">Men</option>
                            <option value="w">Women</option>
                        </select>
                    </div>

                    <div class="form-item">
                        <label>Birthday</label>
                        <input type="date" name="birthday" required>
                    </div>

                    <div class="form-item">
                        Your photo:
                        <input type="file" required>
                    </div>

                    <div class="form-item">
                        <textarea rows="6"></textarea>
                    </div>

                    <div class="form-item">
                        <button class="button primary width-100 big">Complete Sign Up</button>
                    </div>
                </form>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
<%
} else
    if (request.getMethod() == "POST") {

        SimpleDateFormat format = new SimpleDateFormat();
        format.applyPattern("yyyy-MM-dd");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String mail = request.getParameter("mail");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        Date birthday = format.parse(request.getParameter("birthday"));

        User user = new User(mail, password, name, surname, birthday, gender);
        try {
            user.Register();
        } catch (IllegalAction ex) {
            Log.getOut(ex.getMessage());
            response.sendRedirect("/elearning/Error.jsp?e=IllegalAction");
            return;
        } catch (SQLException ex) {
            Log.getOut(ex.getMessage());
            if (ex.getErrorCode() == 1062) {
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="css/kube.min.css">

        <link rel="stylesheet" href="css/kube-ext.css">
        <link rel="stylesheet" href="css/master.css">

    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="row centered registration">
            <div class="col col-4">

                <form action="Registration.jsp" method="post" class="form">
                    <h3 class="text-centered">REGISTRATION</h3>
                    
                    <div class="alert error">
                        <p style="color: red;">The email address you have entered is already registered</p>
                    </div>

                    <div class="form-item">
                        <label>Email</label>
                        <input class="width-100" type="email" name="mail"  placeholder="example@mail.com" required>
                    </div>

                    <div class="form-item">
                        <label>Password</label>
                        <input class="width-100" type="password" name="password" required >
                    </div>

                    <div class="form-item">
                        <label>Password Confirm</label>
                        <input class="width-100" name="password_confirm" type="password" required>
                    </div>

                    <div class="form-item">
                        <label>Name</label>
                        <input class="width-100" name="name" type="text" required value="<%=name%>">
                    </div>

                    <div class="form-item">
                        <label>Surname</label>
                        <input class="width-100" name="surname" type="text" required value="<%=surname%>">
                    </div>

                    <div class="form-item">
                        <label>Gender</label>
                        <select name="gender" required>
                            <%if (gender.equals("m")) {%>
                            <option selected value="m">Men</option>
                            <option value="w">Women</option>
                            <%}
                               if (gender.equals("w")) {%> 
                            <option selected value="m">Men</option>
                            <%}%>
                            <option value="w">Women</option>
                        </select>
                    </div>

                    <div class="form-item">
                        <label>Birthday</label>
                        <input type="date" name="birthday" required>
                    </div>

                    <div class="form-item">
                        Your photo:
                        <input type="file" required>
                    </div>

                    <div class="form-item">
                        <textarea rows="6"></textarea>
                    </div>

                    <div class="form-item">
                        <button class="button primary width-100 big">Complete Sign Up</button>
                    </div>
                </form>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
<%         return;
                }
            } catch (Exception ex) {
                Log.getOut(ex.getMessage());
                response.sendRedirect("/elearning/Error.jsp");
                return;
            }

            response.sendRedirect("login.jsp");
        }
%>