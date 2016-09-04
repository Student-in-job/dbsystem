<%-- 
    Document   : ResetPassword
    Created on : 27.08.2016, 16:25:26
    Author     : ksinn
--%>

<%@page import="javax.mail.MessagingException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/avtorize.jsp"%>
<%
if(user!=null) {response.sendRedirect(request.getServletContext().getContextPath()+"/Userbar.jsp"); return;}

if(request.getMethod()=="POST"){
    
    User us = new User(request.getParameter("mail"), "");
    try{
        us.SendPassword();
    }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
    catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
    catch (MessagingException ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=MesaggingException"); return;} 
    catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}       
%>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page :: <%=request.getServletContext().getInitParameter("SiteName")%> &mdash; 2016 </title>
    <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
	<link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
    <!-- Kube CSS -->
    <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

    <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
    <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">
</head>
<body>

    
    <%@include file="/header.jsp"%>	
                
	<div class="row around">
		<div class="col col-4">		
				<div class="modal">
                                    <div class="modal-header">Send Password</div>
                                    <div class="modal-body">
                                        <div class="form-item">
                                            <p>We send yours password on <%=us.getMail()%></p>
                                        </div>
                                                        
                                    </div> 
			</div>
		</div>
	</div>
    <%@include file="/footer.jsp" %>    
</body>
</html>
<%    
}

if(request.getMethod()=="GET"){
%>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page :: <%=request.getServletContext().getInitParameter("SiteName")%> &mdash; 2016 </title>
    <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
	<link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
    <!-- Kube CSS -->
    <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

    <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
    <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">
</head>
<body>

    
    <%@include file="/header.jsp"%>	
                
	<div class="row around">
		<div class="col col-4">		
				<div class="modal">
                                    <div class="modal-header">Send Password</div>
                                    <div class="modal-body">
                                                    <form method="post" action="" class="form" id="form">
                                                        
                                                        <div class="form-item">
                                                            <label>Email <span class="req">*</span></label>

                                                            <input type="email" name="mail" class="width-100" required>
                                                        </div>
                                                        
                                                        <div class="form-item">
                                                            <button class="button primary width-100 big">Send Password</button>		
                                                        </div>
                                                    
                                                    </form>
                                        <script type="text/javascript" src="<%=request.getServletContext().getContextPath()%>/js/jquery.validate.min.js"></script> 
                                        <script>
                                            $(document).ready(function(){

                                                $("#form").validate({

                                                   rules:{ 

                                                        mail:{
                                                            required: true,
                                                            email: true,
                                                        },
                                                    },

                                                });


                                            }); //end of ready
                                        </script>
                                    </div> 
			</div>
		</div>
	</div>
    <%@include file="/footer.jsp" %>    
</body>
</html>
<%}%>