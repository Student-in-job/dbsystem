<%-- 
    Document   : index.jsp
    Created on : 08.07.2016, 10:45:40
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page :: Online Education System &mdash; 2016 </title>

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
			            <a href="#">UZ</a>
			            <a href="#">RU</a>
			            <a href="#">EN</a>
		            </div>
		        </div>
        	</div>
        	<a class="h4" style="cursor: pointer;" onclick="openNav()"><i class="fa fa-bars"></i> <b>MENU</b></a>
		</div>
	    <div class="col col-3 text-center">
	    	<a href="#"><div class="item centered logo"></div></a>
	    	<h5 class="upper primary">Online Education System</h5>
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
				    <label class="form-item checkbox">
				        <input type="checkbox"> Remember me
				        <a href="#" class="float-right">Lost your password?</a>
				    </label>
				    <div class="form-item">
                                        <button class="button primary width-100 big">Log in</button>		
				    </div>
				    <hr>
                                    <p class="text-center">Don`t have an account yet? <a href="registration.jsp">Sign Up</a></p>    
				</form>
	        </div>
	    </div>
	</div>	
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
	<div class="row around">
		<div class="col text-center">
			<a class="button"><i class="fa fa-chevron-left"></i></a>
			<a class="button success">Updated</a>
			<a class="button">Popular</a>
			<a class="button">All</a>
			<a class="button"><i class="fa fa-chevron-right"></i></a>
		</div>
	</div>
	<div class="row between">
		<div class="col text-center">		
			<div class="item">
				<img src="img/c_1.png">
			</div>
			<div class="course-info centered">
				<div class="item upper">
					<b>Cource name</b>
				</div>
				<div class="item">
					Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum
				</div>
				<div class="item">
					<div class="row">
						<div class="col">
							<span class="success">17/08/2016</span>
						</div>
						<div class="col">
							<a class="button success outline small">Show more &rarr;</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<img src="img/c_2.png">
			</div>
			<div class="course-info centered">
				<div class="item upper">
					<b>Cource name</b>
				</div>
				<div class="item">
					Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum
				</div>
				<div class="item">
					<div class="row">
						<div class="col">
							<span class="success">17/08/2016</span>
						</div>
						<div class="col">
							<a class="button success  small">Show more &rarr;</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<img src="img/c_3.png">
			</div>
			<div class="course-info centered">			
				<div class="item upper">
					<b>Cource name</b>
				</div>
				<div class="item">
					Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum
				</div>
				<div class="item">
					<div class="row">
						<div class="col">
							<span class="success">17/08/2016</span>
						</div>
						<div class="col">
							<a class="button success outline small">Show more &rarr;</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<img src="img/c_4.png">
			</div>
			<div class="course-info centered">			
				<div class="item upper">
					<b>Cource name</b>
				</div>
				<div class="item">
					Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum
				</div>
				<div class="item">
					<div class="row">
						<div class="col">
							<span class="success">17/08/2016</span>
						</div>
						<div class="col">
							<a class="button success outline small">Show more &rarr;</a>
						</div>
					</div>
				</div>
			</div>				
		</div>
	</div>
	<div class="row around">
		<div class="col col-11 text-right"> 
			<a class="button round outline">See all &rarr;</a>
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
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/db_01.png"></a>
			</div>
			<div class="area-info centered">
				<b>MySQL</b>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/db_02.png"></a>
			</div>
			<div class="area-info centered">
				<b>PostgreSQL</b>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/db_03.png"></a>
			</div>
			<div class="area-info centered">
				<b>Oracle</b>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/db_04.png"></a>
			</div>
			<div class="area-info centered">
				<b>Azure</b>
			</div>
		</div>
	</div>
	<div class="row between">
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/db_11.png"></a>
			</div>
			<div class="area-info centered">
				<b>mongoDB</b>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/db_12.png"></a>
			</div>
			<div class="area-info centered">
				<b>MariaDB</b>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/db_13.png"></a>
			</div>
			<div class="area-info centered">
				<b>cassandra</b>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/db_14.png"></a>
			</div>
			<div class="area-info centered">
				<b>Titan</b>
			</div>
		</div>
	</div>
	<div class="row around">
		<div class="col col-11 text-right"> 
			<a class="button round outline">See all &rarr;</a>
		</div>
	</div>	
</div>


<div class="footer">
	<div class="row">
		<div class="col text-center"><h6>Online Education System &copy; 2016, All right reserved.</h6></div>
	</div>	
	<div class="row">
		<div class="col text-center small"><b>Made with <i class="fa fa-heart error"></i> in <a href="http://www.tuit.uz/">TUIT</b></a></div>
	</div>
	<div class="row">
		<div class="col text-center"><p><img src="img/we_love_to_code.png" width="200px" height="31px"></p></div>
	</div>
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
</body>
</html>