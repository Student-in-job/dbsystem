<%-- 
    Document   : header
    Created on : 20.08.2016, 14:44:22
    Author     : ksinn
--%>

<%@page import="DataBasePak.Log"%>
<%@page import="Learning.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row around">
		<div class="col col-3">
			<div id="sidenav" class="sidenav">
	            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	            <div class="row centered">
	            	<img class="logo-round" src="<%=request.getServletContext().getContextPath()%>/img/logo-round.png">
                    </div>
                    
                    <div class="row centered search-box">
                        <form method="get" action="<%=request.getServletContext().getContextPath()%>/Courses.jsp" class="form">
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
		            	<a href="<%=request.getServletContext().getContextPath()%>/about_as.jsp"><b>ABOUT US</b></a>
		            	<a href="<%=request.getServletContext().getContextPath()%>/manual.pdf"><b>MANUAL</b></a>
		            	<a href="<%=request.getServletContext().getContextPath()%>/Courses.jsp"><b>COURSES</b></a>
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
                <h5 class="upper primary"><img width="150" src="<%=request.getServletContext().getContextPath()%>/img/name.png"><%--=request.getServletContext().getInitParameter("SiteName")--%></h5>
	   	</div>
                
	    
<%
String main=(request.getServletContext().getContextPath()+"/").equals(
        request.getRequestURI()
)?"main-":"";
if(user!=null){%>  
<div class="col col-3">
               <div class="col col-8 offset-5"> 
                    <div class="<%=main%>user_board">
                    
                        <img src="<%=request.getServletContext().getContextPath()%>/<%=user.getIco()%>" class="usr-img float-left">
                    
                        <a href="<%=request.getServletContext().getContextPath()%>/Userbar.jsp" style="text-decoration: none;">
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
                   <img src="<%=request.getServletContext().getContextPath()%>/img/<%=main%>login-ico.png"> 
                <a class="<%=main%>login" data-width="450px" data-component="modal" data-target="#login-modal">Log in</a>
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
                                    <p class="text-center"><a href="ResetPassword.jsp" >Lost your password?</a></p>
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
