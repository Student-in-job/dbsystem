<%-- 
    Document   : index.jsp
    Created on : 08.07.2016, 10:45:40
    Author     : ksinn
--%>

<%@page import="java.util.List"%>
<%@page import="Learning.Area"%>
<%@page import="Learning.Program"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
ArrayList<Program> courses = new ArrayList<Program>();//(new Program().getAll()).subList(0, 2);
ArrayList<Area> areas = new ArrayList<Area>(); //(new Area().getAll());
List<Area> areas1, areas2;

if(areas.size()>4){
    areas2 = areas.subList(0, 3);
    int size;
    if(areas.size()>8)
        size = 7;
    else  
        size = areas.size();
    
    areas2 = areas.subList(4, size);
}

%>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page :: <%=request.getServletContext().getInitParameter("SiteName")%> &mdash; 2016 </title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Kube CSS -->
        <link rel="stylesheet" href="css/kube.min.css">

        <link rel="stylesheet" href="css/kube-ext.css">
        <link rel="stylesheet" href="css/master.css">
</head>
<body>

<div class="fst-block">
    
    <%@include file="/header.jsp" %>
                
	<div class="row around">
		<div class="col col-4">
			<div class="valign-25">			
				<div class="item">
					<h2 class="upper primary">Database</h2>
					<h4 class="subheading muted space-both">Intellectual. Laconic. Modern.</h4>
				</div>
			</div>
		</div>
		<div class="col col-5"><img width="86%" src="img/database.png"></div>
	</div>
</div>

<div class="course-block">
	<div class="row around">
		<div class="col text-center">
			<h3 class="upper success">Online Courses</h3>
		</div>
	</div>
			
	<div class="row between">
<c:forEach var="course" items="${courses}">          
		<div class="col text-center">		
			<div class="item">
                            <img src="${course.ico}">
			</div>
			<div class="course-info centered">
				<div class="item upper">
					<b>${course.name}</b>
				</div>
				<div class="item">
					${course.shortInventory}
				</div>
				<div class="item">
					<div class="row">
						
						<div class="col">
                                                    <a class="button success outline small" href="Course.jsp?course_id=${course.iD}">Show more &rarr;</a>
						</div>
					</div>
				</div>
			</div>
		</div>
</c:forEach>               
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
<c:forEach var="area" items="${areas1}">     
		<div class="col text-center">		
			<div class="item">
				<a href="Courses.jsp?area_id=${area.iD}"><img src="${area.ico}"></a>
			</div>
			<div class="area-info centered">
				<b>${area.name}</b>
			</div>
		</div>
</c:forEach>                
	</div>
	<div class="row between">
<c:forEach var="area" items="${areas2}">     
		<div class="col text-center">		
			<div class="item">
				<a href="Courses.jsp?area_id=${area.iD}"><img src="${area.ico}"></a>
			</div>
			<div class="area-info centered">
				<b>${area.name}</b>
			</div>
		</div>
</c:forEach>      
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
