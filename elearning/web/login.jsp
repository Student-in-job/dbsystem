<%-- 
    Document   : authorization
    Created on : 07.07.2016, 16:32:34
    Author     : ksinn
--%>

<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="DataBasePak.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Learning.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
if(request.getParameter("logout")!=null){
    request.getSession().invalidate();
    response.sendRedirect("/elearning/");
    return;
}    
    
if(request.getMethod()=="GET"){
%>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page :: <%=request.getServletContext().getInitParameter("SiteName")%> &mdash; 2016 </title>

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

    
    <%@include file="header.jsp"%>	
                
	<div class="row around">
		<div class="col col-4">		
				<div class="modal">
                                    <div class="modal-header">Sign in</div>
                                    <div class="modal-body">
                                                    <form method="post" action="login.jsp" class="form">
                                                        <div class="form-item">
                                                            <label>Email <span class="req">*</span></label>

                                                            <input type="email" name="mail" class="width-100" required>
                                                        </div>
                                                        <div class="form-item">
                                                            <label>Password <span class="req">*</span></label>

                                                            <input type="password" name="password" class="width-100" required>
                                                        </div>

                                                        <div class="form-item">
                                                            <button class="button primary width-100 big">Log in</button>		
                                                        </div>


                                                        <hr>
                                                        <p class="text-center">Don`t have an account yet? <a href="registration.jsp">Sign Up</a></p>    
                                                        <p class="text-center"><a href="#" >Lost your password?</a></p>
                                                    </form>
                                    </div> 
			</div>
		</div>
	</div>
</body>
</html>
<%
}
else
    if(request.getMethod()=="POST"){

        String mail = request.getParameter("mail");
        String password = request.getParameter("password");
        String hashp = DigestUtils.md2Hex(password);
        User user = new User(mail, hashp);
        boolean a=false;
        try{
            a = user.Authorize();
        }catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); 
%>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page :: <%=request.getServletContext().getInitParameter("SiteName")%> &mdash; 2016 </title>

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

    
    <%@include file="header.jsp"%>	
                
	<div class="row around">
		<div class="col col-4">		
				<div class="modal">
                                    <div class="modal-header">Sign in</div>
                                    <div class="modal-body">
                                                    <form method="post" action="login.jsp" class="form">
                                                        <div class="form-item">
                                                            <span class="req">The email and password that you entered don't match.</span>
                                                        </div>   
                                                        <div class="form-item">
                                                            <label>Email <span class="req">*</span></label>

                                                            <input type="email" name="mail" class="width-100" required>
                                                        </div>
                                                        <div class="form-item">
                                                            <label>Password <span class="req">*</span></label>

                                                            <input type="password" name="password" class="width-100" required>
                                                        </div>

                                                        <div class="form-item">
                                                            <button class="button primary width-100 big">Log in</button>		
                                                        </div>


                                                        <hr>
                                                        <p class="text-center">Don`t have an account yet? <a href="registration.jsp">Sign Up</a></p>    
                                                        <p class="text-center"><a href="#" >Lost your password?</a></p>
                                                    </form>
                                    </div> 
			</div>
		</div>
	</div>
</body>
</html>
<%
        return;}
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect("/elearning/Error.jsp"); return;}
        
        if(a)
        {
            if(request.getParameter("remember")!=null){
                Cookie m = new Cookie("usermail", user.getMail()); 
                m.setMaxAge(3600*24*30);
                Cookie p = new Cookie("password", user.getPassword()); 
                p.setMaxAge(3600*24*30);
                response.addCookie(m);
                response.addCookie(p);
            }
            
            request.getSession().setAttribute("user", user);
            response.sendRedirect("UserBar.jsp");
            
        }
        else{
%>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page :: <%=request.getServletContext().getInitParameter("SiteName")%> &mdash; 2016 </title>

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

    
    <%@include file="header.jsp"%>	
                
	<div class="row around">
		<div class="col col-4">		
				<div class="modal">
                                    <div class="modal-header">Sign in</div>
                                    <div class="modal-body">
                                                    <form method="post" action="login.jsp" class="form">
                                                        <div class="form-item">
                                                            <span class="req">The email and password that you entered don't match.</span>
                                                        </div>
                                                        <div class="form-item">
                                                            <label>Email <span class="req">*</span></label>

                                                            <input type="email" name="mail" class="width-100" required>
                                                        </div>
                                                        <div class="form-item">
                                                            <label>Password <span class="req">*</span></label>
                                                            
                                                            <input type="password" name="password" class="width-100" required>
                                                        </div>

                                                        <div class="form-item">
                                                            <button class="button primary width-100 big">Log in</button>		
                                                        </div>


                                                        <hr>
                                                        <p class="text-center">Don`t have an account yet? <a href="registration.jsp">Sign Up</a></p>    
                                                        <p class="text-center"><a href="#" >Lost your password?</a></p>
                                                    </form>
                                    </div> 
			</div>
		</div>
	</div>
</body>
</html>
<%
        }
    }
%>