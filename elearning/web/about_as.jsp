<%-- 
    Document   : about_as
    Created on : 13.09.2016, 11:08:30
    Author     : ksinn
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="avtorize.jsp"%>
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
					<div class="col col-2  text-center">		
                                        <div class="item">
                                            <img src="<%=request.getServletContext().getContextPath()%>/img/nata.png">
                                        </div>
                                        <div class="item">
                                                <b>Kim Nata</b>

                                        </div>
		</div>	
				</div>
			</div>
		</div>
		<div class="col col-5"><img width="86%" src="img/database.png"></div>
	</div>
</div>

<%@include file="footer.jsp" %>

    
</body>
</html>
