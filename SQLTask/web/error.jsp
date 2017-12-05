<%-- 
    Document   : temple
    Created on : 04.12.2017, 14:39:32
    Author     : ksinn
--%>
<%!String pageTitle = "Error";%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/header.jspf"%>

<div class="row centered bg-blue">
    <div class="col col-3 text-center">
        <img src="${pageContext.request.contextPath}/resources/img/ghost.png" alt="error">
        <div class="p-error">
            <h3>WHOOPS!</h3>
            <p>${pageContext.exception}</p>
        </div>
    </div>
</div>


<%@include file="/footer.jspf"%>

