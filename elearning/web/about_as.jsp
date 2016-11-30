<%-- 
    Document   : about_as
    Created on : 13.09.2016, 11:08:30
    Author     : ksinn
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <!-- Kube CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
        <title>About as</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="user-block">
	<div class="row around">
		<div class="col">
			<h3 class="error upper text-center">People</h3>
		</div>
	</div>	
	<div class="row  left">
		<div class="col text-center">		
			<div class="item">
                            <img src="${pageContext.request.contextPath}/img/ksinn.png">
			</div>
			<div class="item">
				<b>Andreeva Kseniya</b>
				<p>
                                    gre gverbg vtrbtr vberber dvdfbdf vrever erberbe rbeb
                                </p>
			</div>
		</div>
                <div class="col text-center">		
			<div class="item">
                            <img src="${pageContext.request.contextPath}/img/nata.png">
			</div>
			<div class="item">
				<b>Kim Nata</b>
				<p>
                                    gre gverbg vtrbtr vberber dvdfbdf vrever erberbe rbeb
                                </p>
			</div>
		</div>
                <div class="col text-center">		
			<div class="item">
                            <img src="${pageContext.request.contextPath}/img/nata.png">
			</div>
			<div class="item">
				<b>Obidov Javlon</b>
                                <p>
                                    gre gverbg vtrbtr vberber dvdfbdf vrever erberbe rbeb
                                </p>
				
			</div>
		</div>
                                
	</div>        
</div>
        <%@include file="footer.jsp" %>
    </body>
</html>
