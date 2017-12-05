<%-- 
    Document   : FinishTest
    Created on : 10.08.2016, 14:39:43
    Author     : ksinn
--%>
<%!String pageTitle = "temple";%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/header.jspf"%>

<div class="row centered text-center test">
    <div class="col col-8 space-top">
        <img src="${pageContext.request.contextPath}/resources/img/ghost.png" alt="error">
        <h3>You complete</h3>
        <p class="space-top"><a href="" class="button big warning round">&larr; Go back</a></p>
    </div>            
</div>l


<%@include file="/footer.jspf"%>
