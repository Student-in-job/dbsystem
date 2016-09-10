<%-- 
    Document   : Registration
    Created on : Aug 23, 2016, 4:57:22 PM
    Author     : javlonboy
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="DataBasePak.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/avtorize.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");
    
    if(user!=null) {response.sendRedirect(request.getServletContext().getContextPath()+"/Userbar.jsp"); return;}
    
    String name = null;
    String surname = null;
    String mail = null;
    String password = null;
    String gender = null;
    Date birthday = null;
    
    if (request.getMethod().equals("POST")) {

         SimpleDateFormat format = new SimpleDateFormat();
         format.applyPattern("yyyy-MM-dd");
         name = request.getParameter("name");
         surname = request.getParameter("surname");
         mail = request.getParameter("mail");
         password = request.getParameter("password");
         gender = request.getParameter("gender");
         birthday = new Date(format.parse(request.getParameter("birthday")).getTime());

        User nuser = new User(mail, password, name, surname, birthday, gender);

        DataBase db = new DataBase(nuser);
        try{
            db.FindUser();
            response.sendRedirect(request.getRequestURI()+"?unmail="+mail);
            return;
        }catch(ObjectNotFind ex){}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}       
     

        try {
            nuser.Register(request.getPart("picture"));
        }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getRequestURI()+"?e=password"); return;}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}       
     
        response.sendRedirect("login.jsp");
        return;
        }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">

    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" action="Registration.jsp" method="post" class="form" enctype="multipart/form-data">
                    <h3 class="text-centered">REGISTRATION</h3>
<%
    String unmail=request.getParameter("unmail");
    if(unmail!=null){
%>                    
                    <div class="alert error">
                        <p style="color: red;">The <%=unmail%> email address you have entered is already registered</p>
                    </div>
<%}%>
                    <div class="form-item">
                        <label>Email</label>
                        <input class="width-100" type="email" name="mail" required>
                    </div>

                    <div class="form-item">
                        <label>Password</label>
                        <input class="width-100" type="password" name="password" required >
                    </div>

                    <div class="form-item">
                        <label>Password Confirm</label>
                        <input class="width-100" name="password_confirm" id="password" type="password" required>
                    </div>

                    <div class="form-item">
                        <label>Name</label>
                        <input class="width-100" name="name" type="text" required >
                    </div>

                    <div class="form-item">
                        <label>Surname</label>
                        <input class="width-100" name="surname" type="text" required >
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
                        <input type="file" name="picture" required>
                    </div>

                    <div class="form-item">
                        <button class="button primary width-100 big">Complete Sign Up</button>
                    </div>
                </form>
            </div>
        </div>
        <script type="text/javascript" src="<%=request.getServletContext().getContextPath()%>/js/jquery.validate.min.js"></script> 
        <script>
            $(document).ready(function(){

                $("#form").validate({

                   rules:{ 

                        mail:{
                            required: true,
                            email: true
                        },
                        
                        password:{
                            required: true,
                            minlength: 6,
                            maxlength: 45
                        },
                        
                        password_confirm:{
                            required: true,
                            equalTo: "#password"
                        },
                        
                        surname:{
                            required: true,
                            minlength: 1,
                            maxlength: 32
                        },
                        
                        name:{
                            required: true,
                            minlength: 1,
                            maxlength: 32
                        },
                        
                        birthday:{
                            required: true,
                            date: true
                        },
                        
                        picture:{
                            required: true,
                            accept: "png|jpg|jpeg"
                        }
                        
                   }

                });


            }); //end of ready
        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>