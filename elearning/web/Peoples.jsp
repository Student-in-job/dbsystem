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
	
	<link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
	<link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
    <!-- Kube CSS -->
    <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

    <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
    <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">
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
<%for(int i=(p-1)*N; i<p*N/2&&i<users.size(); i++){%> 
		<div class="col text-center">		
			<div class="item">
                            <a href="<%=request.getServletContext().getContextPath()%>/User.jsp?user_id=<%=users.get(i).getID()%>"><img src="<%=request.getServletContext().getContextPath()%>/<%=users.get(i).getIco()%>"></a>
			</div>
			<div class="item">
				<b><%=users.get(i).getName()%> <%=users.get(i).getSurname()%></b>
				<h6 class="error">Tutor</h6>
			</div>
		</div>		
<%}%>                                
	</div>        
	<div class="row between">
<%for(int i=(p-1)*N+N/2; i<p*N&&i<users.size(); i++){%> 
		<div class="col text-center">		
			<div class="item">
                            <a href="<%=request.getServletContext().getContextPath()%>/User.jsp?user_id=<%=users.get(i).getID()%>"><img src="<%=request.getServletContext().getContextPath()%>/<%=users.get(i).getIco()%>"></a>
			</div>
			<div class="item">
				<b><%=users.get(i).getName()%> <%=users.get(i).getSurname()%></b>
				<h6 class="error">Tutor</h6>
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
