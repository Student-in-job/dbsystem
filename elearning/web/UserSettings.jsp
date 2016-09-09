<%-- 
    Document   : UserSettings
    Created on : 27.08.2016, 12:52:06
    Author     : ksinn
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="DataBasePak.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/logfrag.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    if (request.getMethod().equals("GET")) {
        String e = request.getParameter("e");
        
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
        <%@include file="/header.jsp" %>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" action="" method="post" class="form" enctype="multipart/form-data">
                    <h3 class="text-centered">SETTINGS</h3>
<%if("mail".equals(e)){%>
                    <div class="alert error">
                        <p style="color: red;">The email address you have entered is already registered</p>
                    </div>
<%}%>
                    <div class="form-item">
                        <label>Email</label>
                        <input class="width-100" type="email" name="mail" value="<%=user.getMail()%>">
                    </div>
                    
                    <div class="form-item">
                        <label>New Password</label>
                        <input class="width-100" name="password_new" type="password" id="password">
                    </div>
                    
                    <div class="form-item">
                        <label>New Password Confirm</label>
                        <input class="width-100" name="password_confirm" type="password">
                    </div>

                    <div class="form-item">
                        <label>Name</label>
                        <input class="width-100" name="name" type="text" value="<%=user.getName()%>">
                    </div>

                    <div class="form-item">
                        <label>Surname</label>
                        <input class="width-100" name="surname" type="text" value="<%=user.getSurname()%>">
                    </div>

                    <div class="form-item">
                        <label>Gender</label>
                        <select name="gender">
                            <option <%="m".equals(user.getGender())?"selected":""%> value="m">Men</option>
                            <option <%="w".equals(user.getGender())?"selected":""%> value="w">Women</option>
                        </select>
                    </div>

                    <div class="form-item">
                        <label>Birthday</label>
                        <input type="date" name="birthday" value="<%=user.getBirthday()%>">
                    </div>

                    <div class="form-item">
                        Your photo:
                        <input type="file" name="picture">
                    </div>

<%if("password".equals(e)){%>
                    <div class="alert error">
                        <p style="color: red;">Uncorect password!</p>
                    </div>
<%}%>
                                        
                    <div class="form-item">
                        <label>Password <span class="req">*</span></label>
                        <input class="width-100" type="password" name="password" required>
                    </div>

                    <div class="form-item">
                        <button class="button primary width-100 big">Complete</button>
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
                            email: true,
                        },
                        
                        password:{
                            required: true,
                            minlength: 6,
                            maxlength: 45,
                        },
                        
                        password_new:{
                            minlength: 6,
                            maxlength: 45,
                        },
                        
                        password_confirm:{
                            equalTo: "#password",
                        },
                        
                        surname:{
                            minlength: 1,
                            maxlength: 32,
                        },
                        
                        name:{
                            minlength: 1,
                            maxlength: 32,
                        },
                        
                        birthday:{
                            date: true,
                        },
                        
                        picture:{
                            accept: "png|jpg|jpeg",
                        },
                        
                   },

                });


            }); //end of ready
        </script>
        <%@include file="/footer.jsp" %>
    </body>
</html>
<%
}   

    if (request.getMethod().equals("POST")) {

        SimpleDateFormat format = new SimpleDateFormat();
        format.applyPattern("yyyy-MM-dd");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String mail = request.getParameter("mail");
        String password = request.getParameter("new_password");
        String gender = request.getParameter("gender");
        Date birthday = new Date(format.parse(request.getParameter("birthday")).getTime());
        
        if(!user.getMail().equals(mail)){
            DataBase db = new DataBase(new User(mail, ""));
            try{
                db.FindUser();
                response.sendRedirect(request.getRequestURI()+"?e=mail");
                return;
            }catch(ObjectNotFind ex){}
            catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}       
        }

        try {
            user.Change(request.getParameter("password"), mail, password, name, surname, birthday, gender, request.getPart("picture"));
            session.removeAttribute("user");
        }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getRequestURI()+"?e=password"); return;}
        catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
        catch (IOException ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IOExtension"); return;} 
        catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidParameter"); return;} 
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}       
     

            response.sendRedirect("Userbar.jsp");
        }
%>