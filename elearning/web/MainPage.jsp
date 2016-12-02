<%-- 
    Document   : index.jsp
    Created on : 08.07.2016, 10:45:40
    Author     : ksinn
--%>

<%@page import="Model.Area"%>
<%@page import="Model.Program"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
        List<Program> courses = (new Program().getAll());
        ArrayList<Area> areas = (new Area().getAll());
        List<Area> areas1=null, areas2=null; 
   
        if(areas.size()>4){
            areas2 = areas.subList(0, 3);
            int size;
            if(areas.size()>8)
                size = 7;
            else  
                size = areas.size();

            areas2 = areas.subList(4, size);
        } else {
            areas1 = areas;
            areas2=new ArrayList<Area>();
        }
        
        if(courses.size()>3){
            courses = courses.subList(0, 2);
        }
        
        request.setAttribute("courses", courses);
        request.setAttribute("areas1", areas1);
        request.setAttribute("areas2", areas2);
        
%>

<!DOCTYPE html>
<html>
<head>
    <title>Main Page :: ${initParam.SiteName} &mdash; 2016 </title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
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
		<div class="col col-5"><img width="86%" src="${pageContext.request.contextPath}/img/database.png"></div>
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
					${course.shortDescription}
				</div>
				<div class="item">
					<div class="row">
						
						<div class="col">
                                                    <a class="button success outline small" href="${pageContext.request.contextPath}/program/Program?id=${course.id}">Show more &rarr;</a>
						</div>
					</div>
				</div>
			</div>
		</div>
</c:forEach>               
	</div>
	<div class="row around">
		<div class="col col-11 text-right"> 
                    <a href="${pageContext.request.contextPath}/program/Courses" class="button round outline">See all &rarr;</a>
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
				<a href="${pageContext.request.contextPath}/program/Courses?area_id=${area.id}"><img src="${area.ico}"></a>
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
				<a href="${pageContext.request.contextPath}/program/Courses?area_id=${area.id}"><img src="${area.ico}"></a>
			</div>
			<div class="area-info centered">
				<b>${area.name}</b>
			</div>
		</div>
</c:forEach>      
	</div>
	<div class="row around">
		<div class="col col-11 text-right"> 
			<a class="button round outline" href="${pageContext.request.contextPath}/program/Areas">See all &rarr;</a>
		</div>
	</div>	
</div>


<%@include file="/footer.jsp" %>

    
</body>
</html>
