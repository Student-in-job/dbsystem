<%-- 
    Document   : index.jsp
    Created on : 08.07.2016, 10:45:40
    Author     : ksinn
    Домашняя страница приложения.   
--%>
<%@page import="Entety.Course"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:query var="courses" dataSource="jdbc/DB">
    select course.id, name, start_date, description, program from course join program on program = program.id where open = 1 order by start_date limit 3
</sql:query>
    
<%! String pageTitle = "Main Page";%>
<%@include file="/header.jsp" %>
 <div class="fst-block">  
     <%@include file="/bar.jsp" %>
	<div class="row around">
		<div class="col col-4">
			<div class="valign-25">			
				<div class="item">
                                    <div class="h2 bold upper primary"><i class="fa fa-terminal" style="color:#000"></i><span id="blink">|</span> Database</div>
					<div class="h3 bold subheading muted space-both">Intellectual. Laconic. Modern.</div>
				</div>
			</div>
		</div>
		<div class="col col-5"><img src="${pageContext.request.contextPath}/resourse/img/database.png"></div>
	</div>
</div>

<div class="course-block">
	<div class="row around">
		<div class="col text-center space-top">
			<h2 class="upper success">Online Courses</h2>
		</div>
	</div>
			
	<div class="row between">
<c:forEach var="course" items="${courses.rows}">          
		<div class="col text-center">		
			<div class="item">
                            <img src="${pageContext.request.contextPath}/${initParam.FileDir}/program/${course.program}.jpg" onerror="if (this.src != 'error.jpg') this.src = '${pageContext.request.contextPath}/resourse/img/default_program.png';">
			</div>
			<div class="course-info centered">
				<div class="item upper">
					<b>${course.name}</b>
				</div>
                                <div class="item upper">
					<b>${course.start_date}</b>
				</div>
				<div class="item">
					${course.description}
				</div>
				<div class="item">
					<div class="row">
						<div class="col">
                                                    <a class="button success outline small" href="${pageContext.request.contextPath}/course/render?id=${course.id}">Show more &rarr;</a>
						</div>
					</div>
				</div>
			</div>
		</div>
</c:forEach>               
	</div>
	<div class="row around">
		<div class="col col-11  space-top text-right"> 
                    <%--<a href="${pageContext.request.contextPath}/program/Courses" class="button round outline">See all &rarr;</a>--%>
		</div>
	</div>
</div>
<%@include file="/footer.jsp" %>
   
