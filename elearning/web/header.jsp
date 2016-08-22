<%-- 
    Document   : header
    Created on : 20.08.2016, 14:44:22
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
                            <a href="people.jsp"><b>PEOPLE</b></a>
                        </div>
                    </div>
        	</div>
        	<a class="h4" style="cursor: pointer;" onclick="openNav()"><i class="fa fa-bars"></i> <b>MENU</b></a>
		</div>
	    <div class="col col-3 text-center">
	    	<a href="/elearning"><div class="item centered logo"></div></a>
	    	<h5 class="upper primary"><%=request.getServletContext().getInitParameter("SiteName")%></h5>
	   	</div>
	    <div class="col col-3 text-right"><img src="img/login-ico.png"> <a class="login" data-width="450px" data-component="modal" data-target="#login-modal">Log in</a></div>
	</div>
	<div id="login-modal" class="modal-box hide">
	    <div class="modal">
	        <span class="close"></span>
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
	    </div
	</div>
                
<!-- Kube JS + jQuery are used for some functionality, but are not required for the basic setup -->
    <script src="js/jquery.min.js"></script>
    <script src="js/kube.min.js"></script>
	<script>
		function openNav() {
		    document.getElementById("sidenav").style.width = "100%";
		}

		function closeNav() {
		    document.getElementById("sidenav").style.width = "0";
		}
	</script>                