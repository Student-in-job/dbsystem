<%-- 
    Document   : Areas
    Created on : 20.08.2016, 15:04:50
    Author     : ksinn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="avtorize.jsp"%>
<%
ArrayList<Area> areas = (new Area().getAll());
int p;
try{
    p = Integer.parseInt(request.getParameter("page"));
}catch(Exception ex){p=1;}
int b = p-1;
int n = (p*8)<areas.size()?p+1:0;

%>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page :: <%=request.getServletContext().getInitParameter("SiteName")%> &mdash; 2016 </title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
	<link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
    <!-- Kube CSS -->
    <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

    <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
    <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">
</head>
<body>


    
    <%@include file="header.jsp"%>	
                
	



<div class="area-block">
	<div class="row around">
		<div class="col">
			<h3 class="warning upper text-center">Areas</h3>
		</div>
	</div>

	<div class="row left">
<%for(int i=(p-1)*8; i<p*8-4&&i<areas.size(); i++){%>     
		<div class="col col-3 text-center">		
			<div class="item">
                            <a href="<%=request.getServletContext().getContextPath()%>/Courses.jsp?area_id=<%=areas.get(i).getID()%>"><img src="<%=request.getServletContext().getContextPath()%>/<%=areas.get(i).getIco()%>"></a>
			</div>
			<div class="area-info centered">
				<b><%=areas.get(i).getName()%></b>
			</div>
		</div>
<%}%>
	</div>
        
	<div class="row left">
<%for(int i=(p-1)*8+4; i<p*8&&i<areas.size(); i++){%>     
		<div class="col col-3 text-center">		
			<div class="item">
                            <a href="<%=request.getServletContext().getContextPath()%>/Courses.jsp?area_id=<%=areas.get(i).getID()%>"><img src="<%=request.getServletContext().getContextPath()%>/<%=areas.get(i).getIco()%>"></a>
			</div>
			<div class="area-info centered">
				<b><%=areas.get(i).getName()%></b>
			</div>
		</div>
<%}%>
	</div>
        
	<div class="row around">
		<div class="col col-11 text-right"> 
                    <%if(b!=0){%><a href="?page=<%=String.valueOf(b)%>" class="button round outline">&larr;</a><%}%>
                    <%if(n!=0){%><a href="?page=<%=String.valueOf(n)%>" class="button round outline">&rarr;</a><%}%>
		</div>
	</div>	
</div>


<%@include file="footer.jsp" %>

    
</body>
</html>