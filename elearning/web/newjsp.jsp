<%-- 
    Document   : newjsp
    Created on : 23.08.2016, 16:07:36
    Author     : ksinn
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>jQuery Validation plugin: integration with TinyMCE</title>

<link href="img/favicon.png" rel="shortcut icon" type="image/x-icon">
<script src="../../lib/jquery.js"></script>
<script src="../../dist/jquery.validate.js"></script>
<script src="tiny_mce.js"></script>
<script>


<sql:query var="rs" dataSource="jdbc/DB">
select user_id, user_name from user
</sql:query>

<html>
  <head>
    <title>DB Test</title>
  </head>
  <body>

  <h2>Results</h2>

<c:forEach var="row" items="${rs.rows}">
    Foo ${user.user_id}<br/>
    Bar ${user.user_name}<br/>
</c:forEach>

  </body>
</html>
