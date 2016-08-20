<%-- 
    Document   : course
    Created on : Aug 20, 2016, 3:06:53 PM
    Author     : javlonboy
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
int N=12;  //число записей на странице  
ArrayList<Program> courses = (new Program(1).getAll());
int p = Integer.parseInt(request.getParameter("page"));
int b = p-1;
int n = (p*N)<courses.size()?p+1:0;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Courses</title>
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
        
        <div class="course-block">
	<div class="row around">
		<div class="col text-center">
			<h3 class="upper success">Online Courses</h3>
		</div>
	</div>
			
	<div class="row between">
<%for(int i=(p-1)*N; i<p*N&&i<courses.size(); i++){%>            
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
							<a class="button success outline small" href="Courses.jsp?cours_id=<%=courses.get(i).getID()%>">Show more &rarr;</a>
						</div>
					</div>
				</div>
			</div>
		</div>
<%}%>  

	</div>
        <div class="row around">
		<div class="col col-11 text-right"> 
                    <%if(b!=0){%><a href="Courses.jsp?page=<%=String.valueOf(b)%>" class="button round outline">&larr;</a><%}%>
                    <%if(n!=0){%><a href="Courses.jsp?page=<%=String.valueOf(n)%>" class="button round outline">&rarr;</a><%}%>
		</div>
	</div>	
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
