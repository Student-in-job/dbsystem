<%-- 
    Document   : index.jsp
    Created on : 08.07.2016, 10:45:40
    Author     : ksinn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page import="DataBasePak.Log"%>
<%@page import="Learning.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="avtorize.jsp"%>
<%
ArrayList<Program> courses = (new Program().getAll());
ArrayList<Area> areas = (new Area().getAll());
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

<div class="fst-block">
    
    <!--header START-->
 
<div class="row around">
		<div class="col col-3">
			<div id="sidenav" class="sidenav">
	            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	            <div class="row centered">
	            	<div class="item logo"></div>
	            </div>
	            <div class="valign-sidenav">
		            <div class="row centered">
		            	<a href="#"><b>ABOUT US</b></a>
		            	<a href="#"><b>MANUAL</b></a>
		            	<a href="#"><b>COURSES</b></a>
		            </div>
                        <div class="row centered">
                            <a href="<%=request.getServletContext().getContextPath()%>/Peoples.jsp"><b>PEOPLE</b></a>
                        </div>
                    </div>
        	</div>
        	<a class="h4" style="cursor: pointer;" onclick="openNav()"><i class="fa fa-bars"></i> <b>MENU</b></a>
		</div>
	    <div class="col col-3 text-center">
	    	<a href="<%=request.getServletContext().getContextPath()%>"><div class="item centered logo"></div></a>
	    	<h5 class="upper primary"><%=request.getServletContext().getInitParameter("SiteName")%></h5>
	   	</div>
                
	    
<%
if(user!=null){%>  
<div class="col col-3">
               <div class="col col-8 offset-5"> 
                    <div class="user_board">
                    
                        <img src="<%=request.getServletContext().getContextPath()%>/<%=user.getIco()%>" class="usr-img float-left">
                    
                    <a href="<%=request.getServletContext().getContextPath()%>/Userbar.jsp">
                        <button>
                            <%=user.getName()%> &rarr;
                        </button>
                    </a>
                    <br>
                    <a href="<%=request.getServletContext().getContextPath()%>/login.jsp?logout=ok" >Log out</a>
                    </div>
               </div>
</div>
                    
<%}else{%>                
               <div class="col col-3 text-right">
                   <img src="<%=request.getServletContext().getContextPath()%>/img/login-ico.png"> 
                <a class="login" data-width="450px" data-component="modal" data-target="#login-modal">Log in</a>
            </div>

                <%}%>            

	<div id="login-modal" class="modal-box hide">
	    <div class="modal">
	        <span class="close"></span>
	        <div class="modal-header">Sign in</div>
	        <div class="modal-body">
				<form method="post" action="<%=request.getServletContext().getContextPath()%>/login.jsp" class="form">
				    <div class="form-item">
				        <label>Email <span class="req">*</span></label>
				        
				        <input type="email" name="mail" class="width-100" required>
				    </div>
				    <div class="form-item">
				        <label>Password <span class="req">*</span></label>
				        
				        <input type="password" name="password" class="width-100" required>
				    </div>
                                    <label class="form-item checkbox">
				        <input type="checkbox"  name="remember" value="ok"> Remember me
				    </label>
				    <div class="form-item">
                                        <button class="button primary width-100 big">Log in</button>		
				    </div>
                                    
                                    
				    <hr>
                                    <p class="text-center">Don`t have an account yet? <a href="<%=request.getServletContext().getContextPath()%>/Registration.jsp">Sign Up</a></p>    
                                    <p class="text-center"><a href="#" >Lost your password?</a></p>
				</form>
	        </div> 
            </div>
	</div>
      </div>         
<!-- Kube JS + jQuery are used for some functionality, but are not required for the basic setup -->
    <script src="<%=request.getServletContext().getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getServletContext().getContextPath()%>/js/kube.min.js"></script>
	<script>
		function openNav() {
		    document.getElementById("sidenav").style.width = "100%";
		}

		function closeNav() {
		    document.getElementById("sidenav").style.width = "0";
		}
	</script>                
    <!--header END-->
                
	<div class="row around">
		<div class="col col-4">
			<div class="valign-25">			
				<div class="item">
					<h2 class="upper primary">Database</h2>
					<h4 class="subheading muted space-both">Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor</h4>
				</div>
				<div class="item">
					<a class="button round outline">Show more &rarr;</a>
				</div>
			</div>
		</div>
		<div class="col col-5"><img src="img/database.png"></div>
	</div>
</div>

<div class="course-block">
	<div class="row around">
		<div class="col text-center">
			<h3 class="upper success">Online Courses</h3>
		</div>
	</div>
			
	<div class="row between">
<%for(int i=0; i<3&&i<courses.size(); i++){%>            
		<div class="col text-center">		
			<div class="item">
                            <img src="<%=courses.get(i).getIco()%>">
			</div>
			<div class="course-info centered">
				<div class="item upper">
					<b><%=courses.get(i).getName()%></b>
				</div>
				<div class="item">
					<%=courses.get(i).getInventory().substring(0, 50)+"..."%>
				</div>
				<div class="item">
					<div class="row">
						
						<div class="col">
                                                    <a class="button success outline small" href="Course.jsp?course_id=<%=courses.get(i).getID()%>">Show more &rarr;</a>
						</div>
					</div>
				</div>
			</div>
		</div>
<%}%>                
	</div>
	<div class="row around">
		<div class="col col-11 text-right"> 
                    <a href="Courses.jsp" class="button round outline">See all &rarr;</a>
		</div>
	</div>
</div>

<div class="area-block">
	<div class="row around">
		<div class="col">
			<h3 class="warning upper text-center">Areas</h3>
		</div>
	</div>
<div class="row between">
<%for(int i=0; i<4&&i<areas.size(); i++){%>     
		<div class="col text-center">		
			<div class="item">
				<a href="Courses.jsp?area_id=<%=areas.get(i).getID()%>"><img src="<%=areas.get(i).getIco()%>"></a>
			</div>
			<div class="area-info centered">
				<b><%=areas.get(i).getName()%></b>
			</div>
		</div>
<%}%>                
	</div>
	<div class="row between">
<%for(int i=4; i<8&&i<areas.size(); i++){%>     
		<div class="col text-center">		
			<div class="item">
				<a href="Courses.jsp?area_id=<%=areas.get(i).getID()%>"><img src="<%=areas.get(i).getIco()%>"></a>
			</div>
			<div class="area-info centered">
				<b><%=areas.get(i).getName()%></b>
			</div>
		</div>
<%}%>
	</div>
	<div class="row around">
		<div class="col col-11 text-right"> 
			<a class="button round outline" href="Areas.jsp">See all &rarr;</a>
		</div>
	</div>	
</div>


<%@include file="footer.jsp" %>

    
</body>
</html>