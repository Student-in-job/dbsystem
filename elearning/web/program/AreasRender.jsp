<%-- 
    Document   : Areas
    Created on : 20.08.2016, 15:04:50
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Areas :: ${initParam.SiteName} &mdash; 2016 </title>
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

<%@include file="/header.jsp"%>	
 <div class="area-block">
	<div class="row around">
		<div class="col">
			<h3 class="warning upper text-center">Areas</h3>
		</div>
	</div>

	<div class="row left">
            <c:forEach items="${areas1}" var="area">     
		<div class="col col-3 text-center">		
			<div class="item">
                            <a href="${pageContext.request.contextPath}/program/Courses?area_id=${area.id}"><img src="${pageContext.request.contextPath}/${area.ico}"></a>
			</div>
			<div class="area-info centered">
				<b>${area.name}</b>
			</div>
		</div>
            </c:forEach>
	</div>
        
	<div class="row left">
            <c:forEach items="${areas2}" var="area">     
		<div class="col col-3 text-center">		
			<div class="item">
                            <a href="${pageContext.request.contextPath}/program/Courses?area_id=${area.id}"><img src="${pageContext.request.contextPath}/${area.ico}"></a>
			</div>
			<div class="area-info centered">
				<b>${area.name}</b>
			</div>
		</div>
            </c:forEach>
	</div>
        
	<div class="row around">
		<div class="col col-11 text-right"> 
                    <c:if test="${befor!=0}"><a href="?page=${befor}" class="button round outline">&larr;</a></c:if>
                    <c:if test="${next!=0}"><a href="?page=${next}" class="button round outline">&rarr;</a></c:if>
		</div>
	</div>	
</div>


<%@include file="/footer.jsp" %>

    
</body>
</html>