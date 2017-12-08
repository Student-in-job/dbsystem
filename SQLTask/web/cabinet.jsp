<%-- 
    Document   : temple
    Created on : 04.12.2017, 14:39:32
    Author     : ksinn
--%>
<%!String pageTitle = "temple";%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/header.jspf"%>

<div class="row userbar-1">
    <div class="col col-3 text-right">
    </div>
</div>
<div class="row userbar-2 ">
    <div class="col col-2 offset-1 nav">
        <a href="#group" class="tablink a-blue" onclick="openTab(event, 'group')">My lists</a>
    </div>
    <div class="col col-8 border">
        <div id="group" class="courses">

            <h3>
                My list 
                <a class="test-edit" href="${pageContext.request.contextPath}/task/add/list"><i class="fa fa-plus-square-o font-blue" aria-hidden="true"></i></a>
            </h3>
            <c:forEach var="list" items="${lists}">
                <p>
                    <a href="${pageContext.request.contextPath}/task/list?id=${list.id}">${list.name}</a>
                </p> 
            </c:forEach>
        </div>   
    </div>
</div>
</div>  
<script>
    document.getElementById("group").style.display = "block";

    function openTab(evt, cityName) {
        var i, x, tablinks;
        x = document.getElementsByClassName("courses");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablink");
        for (i = 0; i < x.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" a-blue", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " a-blue";
    }
</script>


<%@include file="/footer.jspf"%>

