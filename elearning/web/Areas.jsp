<%-- 
    Document   : Areas
    Created on : 20.08.2016, 15:04:50
    Author     : ksinn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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


    
    <%@include file="header.jsp"%>	
                
	



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