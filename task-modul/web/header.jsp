<%-- 
    Document   : header
    Created on : 20.08.2016, 14:44:22
    Author     : ksinn
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/Error.jsp"%>

<div class="row around">
		<div class="col col-3">
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
               <div class="col col-3 text-right">
               </div>          

	<div id="login-modal" class="modal-box hide">
	    <div class="modal">
	        <span class="close"></span>
	        <div class="modal-header">Sign in</div>
	        <div class="modal-body">
				<form method="post" action="${pageContext.request.contextPath}/login.jsp" class="form">
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
                                    <p class="text-center">Don`t have an account yet? <a href="${pageContext.request.contextPath}/Registration.jsp">Sign Up</a></p>    
                                    <p class="text-center"><a href="ResetPassword.jsp" >Lost your password?</a></p>
				</form>
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
