<%-- 
    Document   : people
    Created on : Aug 22, 2016, 11:51:04 AM
    Author     : javlonboy
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Learning.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
int N=12;  //число записей на странице
ArrayList<User> users;

String find = request.getParameter("find");

    if(find!=null)
        users = (new User()).Find(find); 
    else
        users = (new User().getAll());

    

int p;
try{
    p = Integer.parseInt(request.getParameter("page"));
}catch(Exception ex){p=1;}
int b = p-1;
int n = (p*N)<users.size()?p+1:0;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Kube CSS -->
    <link rel="stylesheet" href="css/kube.min.css">

    <link rel="stylesheet" href="css/kube-ext.css">
    <link rel="stylesheet" href="css/master.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="user-block">
	<div class="row around">
		<div class="col">
			<h3 class="error upper text-center">People</h3>
		</div>
	</div>
	
	<div class="row between">
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/user_06.png"></a>
			</div>
			<div class="item">
				<b>John Doe</b>
				<h6 class="error">Tutor</h6>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/user_09.png"></a>
			</div>
			<div class="item">
				<b>Jane Doe</b>
				<h6 class="error">Tutor</h6>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/user_11.png"></a>
			</div>
			<div class="item">
				<b>John Doe</b>
				<h6 class="error">Student</h6>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/user_13.png"></a>
			</div>
			<div class="item">
				<b>Jane Doe</b>
				<h6 class="error">Student</h6>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/user_15.png"></a>
			</div>
			<div class="item">
				<b>John Doe</b>
				<h6 class="error">Student</h6>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/user_03.png"></a>
			</div>
			<div class="item">
				<b>John Doe</b>
				<h6 class="error">Student</h6>
			</div>
		</div>								
	</div>
	<div class="row between">
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/user_23.png"></a>
			</div>
			<div class="item">
				<b>Jane Doe</b>
				<h6 class="error">Student</h6>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/user_24.png"></a>
			</div>
			<div class="item">
				<b>John Doe</b>
				<h6 class="error">Student</h6>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/user_26.png"></a>
			</div>
			<div class="item">
				<b>Jane Doe</b>
				<h6 class="error">Student</h6>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/user_28.png"></a>
			</div>
			<div class="item">
				<b>Jane Doe</b>
				<h6 class="error">Student</h6>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/user_29.png"></a>
			</div>
			<div class="item">
				<b>John Doe</b>
				<h6 class="error">Student</h6>
			</div>
		</div>
		<div class="col text-center">		
			<div class="item">
				<a href="#"><img src="img/user_30.png"></a>
			</div>
			<div class="item">
				<b>John Doe</b>
				<h6 class="error">Student</h6>
			</div>
		</div>								
	</div>
	<div class="row around">
		<div class="col col-11 text-right">
                    <a href="#" class="button round outline">&larr;</a>
                    <a href="#" class="button round outline">&rarr;</a>
		</div>
	</div>
</div>
        <%@include file="footer.jsp" %>
    </body>
</html>
