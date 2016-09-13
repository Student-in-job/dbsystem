<%-- 
    Document   : course
    Created on : Aug 20, 2016, 3:06:53 PM
    Author     : javlonboy
--%>
<%@page import="DataBasePak.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="avtorize.jsp"%>
<% 
int N=12;  //число записей на странице
ArrayList<Program> courses;
String area_name = "";

String find = request.getParameter("find");
int area_id;
    try{
        area_id = Integer.parseInt(request.getParameter("area_id"));
    }catch(Exception ex){area_id=0;}

if(area_id!=0){
    try{
        if(find!=null){
            Area area = new Area(area_id);
            area_name = area.getName();
            courses = area.FindPrograms(find);
        }else{
            Area area = new Area(area_id);
            area_name = area.getName();
            courses = area.getPrograms();
        }
    }catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
    catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}      
}
else{
    if(find!=null)
        courses = (new Program()).Find(find); 
    else
        courses = (new Program().getAll());
}
    

int p;
try{
    p = Integer.parseInt(request.getParameter("page"));
}catch(Exception ex){p=1;}
int b = p-1;
int n = (p*N)<courses.size()?p+1:0;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Courses</title>
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
        
        <div class="course-block">
	<div class="row around">
		<div class="col text-center">
			<h3 class="upper success"><%=area_id==0?"Online Courses":area_name%></h3>
		</div>
	</div>
			
	<div class="row between">
<%if(courses.size()==0){%>  
<div class="col text-center">
<div class="item">
    <p>Nothing yet</p>
</div>
</div>
<%}%>
<%for(int i=(p-1)*N; i<p*N&&i<courses.size(); i++){%>            
		<div class="col text-center">		
			<div class="item">
                            <img src="<%=request.getServletContext().getContextPath()%>/<%=courses.get(i).getIco()%>">
			</div>
			<div class="course-info centered">
				<div class="item upper">
					<b><%=courses.get(i).getName()%></b>
				</div>
				<div class="item">
					<%=courses.get(i).getInventory().length()>50?courses.get(i).getInventory().substring(0, 50)+"...":courses.get(i).getInventory()%>
				</div>
				<div class="item">
					<div class="row">
						
						<div class="col">
							<a class="button success outline small" href="<%=request.getServletContext().getContextPath()%>/Course.jsp?course_id=<%=courses.get(i).getID()%>">Show more &rarr;</a>
						</div>
					</div>
				</div>
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
