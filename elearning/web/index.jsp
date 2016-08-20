<%-- 
    Document   : index.jsp
    Created on : 08.07.2016, 10:45:40
    Author     : ksinn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
ArrayList<Program> courses = (new Program(1).getAll());
ArrayList<Area> areas = (new Area(1).getAll());


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
    
    <%@include file="header.jsp"%>	
                
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
                                                    <a class="button success outline small" href="one_course.jsp?cours_id=<%=courses.get(i).getID()%>">Show more &rarr;</a>
						</div>
					</div>
				</div>
			</div>
		</div>
<%}%>                
	</div>
	<div class="row around">
		<div class="col col-11 text-right"> 
                    <a href="course.jsp" class="button round outline">See all &rarr;</a>
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
				<a href="Areas.jsp?area_id=<%=areas.get(i).getID()%>"><img src="<%=areas.get(i).getIco()%>"></a>
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
				<a href="Areas.jsp?area_id=<%=areas.get(i).getID()%>"><img src="<%=areas.get(i).getIco()%>"></a>
			</div>
			<div class="area-info centered">
				<b><%=areas.get(i).getName()%></b>
			</div>
		</div>
<%}%>
	</div>
	<div class="row around">
		<div class="col col-11 text-right"> 
			<a class="button round outline">See all &rarr;</a>
		</div>
	</div>	
</div>


<%@include file="footer.jsp" %>

    
</body>
</html>