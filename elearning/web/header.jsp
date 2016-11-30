<%-- 
    Document   : header
    Created on : 20.08.2016, 14:44:22
    Author     : ksinn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="API.AppInf"%>
<%@page import="Learning.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
String main = (request.getServletContext().getContextPath()+"/").equals(request.getRequestURI())?"main-":"";    
    
String client_id = "1006393654499-p8mr2fj0fkg43ifvl68eo2k18o6u2qgm.apps.googleusercontent.com";
String client_secret = "lU9JFY65Oy7Oas33THOn_CUN";
String redirect_uri = AppInf.main+"/user/SignIn";
String response_type = "code";
String scope = "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile";

String auth_url = "https://accounts.google.com/o/oauth2/auth?" 
        + "client_id=" + client_id 
        + "&redirect_uri=" +  redirect_uri
        + "&response_type=" + response_type
        + "&scope=" + scope;

pageContext.setAttribute("auth_url", auth_url);
pageContext.setAttribute("main", main);
%>
<div class="message">
    ${message}
</div>
<div class="row around">
		<div class="col col-3">
			<div id="sidenav" class="sidenav">
	            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	            <div class="row centered">
	            	<img class="logo-round" src="${pageContext.request.contextPath}/img/logo-round.png">
                    </div>
                    
                    <div class="row centered search-box">
                        <form method="get" action="${pageContext.request.contextPath}/Courses.jsp" class="form">
                            <div class="form-item">
                                <div class="controls">
                                <input type="text" name="find" placeholder="Search">
                                <button class="button primary">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    
	            <div class="valign-sidenav">
		            <div class="row centered">
		            	<a href="${pageContext.request.contextPath}/about_as.jsp"><b>ABOUT US</b></a>
		            	<a href="${pageContext.request.contextPath}/manual.pdf"><b>MANUAL</b></a>
		            	<a href="${pageContext.request.contextPath}/Courses.jsp"><b>COURSES</b></a>
		            </div>
                        <div class="row centered">
                            <a href="${pageContext.request.contextPath}/Peoples.jsp"><b>PEOPLE</b></a>
                        </div>
                    </div>
        	</div>
        	<a class="h4" style="cursor: pointer;" onclick="openNav()"><i class="fa fa-bars"></i> <b>MENU</b></a>
		</div>
	    <div class="col col-3 text-center">
	    	<a href="${pageContext.request.contextPath}"><div class="item centered logo"></div></a>
                <h5 class="upper primary"><img width="150" src="${pageContext.request.contextPath}/img/name.png"><%--=request.getServletContext().getInitParameter("SiteName")--%></h5>
	    </div>
<c:choose>
    <c:when test="${user != null}">
            <div class="col col-3">
                           <div class="col col-8 offset-5"> 
                                <div class="${main}user_board">

                                    <img src="${pageContext.request.contextPath}/${user.ico}" class="usr-img float-left">

                                    <a href="${pageContext.request.contextPath}/Userbar.jsp" style="text-decoration: none;">
                                    <button>
                                        ${user.name} &rarr;
                                    </button>
                                </a>
                                <br>
                                <a href="${pageContext.request.contextPath}/login.jsp?logout=ok" >Log out</a>
                                </div>
                           </div>
            </div>        
    </c:when>
    <c:otherwise>
            <div class="col col-3 text-right">
                   <img src="${pageContext.request.contextPath}/img/${main}login-ico.png"> 
                <a class="${main}login" data-width="450px" data-component="modal" data-target="#login-modal">Log in</a>
            </div>
    </c:otherwise>
</c:choose>
        <div id="login-modal" class="modal-box hide">
	    <div class="modal">
	        <span class="close"></span>
	        <div class="modal-header">Sign in</div>
	        <div class="modal-body">
                    
                    <a href="${auth_url}"><img class="login-favicons" src="${pageContext.request.contextPath}/img/google-favicon.svg"></a>
                    <a href="${pageContext.request.contextPath}/auth1"><img class="login-favicons" src="${pageContext.request.contextPath}/img/google-favicon.svg"></a>
	        </div> 
            </div>
	</div>
      </div>
<!-- Kube JS + jQuery are used for some functionality, but are not required for the basic setup -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/kube.min.js"></script>
	<script>
		function openNav() {
		    document.getElementById("sidenav").style.width = "100%";
		}

		function closeNav() {
		    document.getElementById("sidenav").style.width = "0";
		}
	</script>                
