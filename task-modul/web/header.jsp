<%-- 
    Document   : header
    Created on : 20.08.2016, 14:44:22
    Author     : ksinn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="API.AppInf"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/Error.jsp"%>

<div class="row around">
		<div class="col col-3 space-top">
			<div id="sidenav" class="sidenav">
	            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	            <div class="row centered">
	            	<img class="logo-round" src="img/logo-round.png">
                    </div>
                    
                    <div class="row centered search-box">
                        <form method="get" action="${pageContext.request.contextPath}/Courses.jsp" class="form">
                            <div class="form-item">
                                <div class="controls">
                                    <input type="text" name="find" placeholder="Search">
                                    <button class="button inverted">
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
        	<a class="h3" style="cursor: pointer;" onclick="openNav()"><i class="fa fa-bars"></i> <b>MENU</b></a>
		</div>
	    <div class="col col-3 text-center">
	    	<a href="${pageContext.request.contextPath}/main"><div class="item centered logo"></div></a>
                <h5 class="upper primary"><img width="150" src="${pageContext.request.contextPath}/img/name.png"><%--=request.getServletContext().getInitParameter("SiteName")--%></h5>
	   	</div>                
               <div class="col col-3">
                   <c:if test="${user != null}">
                           <div class="col col-8 offset-5 space-top"> 
                                <div class="${main}user_board">

                                    <img src="${AppInf.main}/${user.ico}" class="usr-img float-left">

                                    <a href="${pageContext.request.contextPath}/main" class="button small round outline" style="text-decoration: none;">${user.name} &rarr;</a>
                                <br>
                                <a href="${pageContext.request.contextPath}/user/LogOut" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;Log out <i class="fa fa-sign-out"></i></a>
                                </div>
                           </div>        
                    </c:if>
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
