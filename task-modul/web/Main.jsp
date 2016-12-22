<%-- 
    Document   : main
    Created on : 19.11.2016, 10:58:41
    Author     : ksinn
--%>
<%@page import="API.AppInf"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/Error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Userbar</title>
        <link href="${pageContext.request.contextPath}/img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">


    </head>
    <body>
        <div class=userbar>
            <%@include file="/header.jsp" %>
            <div class="row userbar-1">
                <div class="col col-3 text-right">
                    <img src="${AppInf.main}/${user.ico}" alt="" class="img-circle">
                </div>
                <div class="col col-3">
                    <br>
                    <p>
                        <span class="bold">${user.name} ${user.surname}</span><br>
                        E-Mail:  ${user.mail}<br>
                    </p>
                </div>
            </div>
            <div class="row userbar-2 ">
                <div class="col col-2 offset-1 nav">
                    <a href="#group" class="tablink a-blue" onclick="openTab(event, 'group')">My group</a>
                </div>
                <div class="col col-8 border">
                    <div id="group" class="courses">
                        <h3>My group</h3>
                        <c:forEach var="group" items="${group_list}">
                        <p>
                            <a href="${pageContext.request.contextPath}/owner/Group?group=${group.id}">${group.name}</a>
                        </p> 
                        </c:forEach>
                        <p>
                            <a href="${pageContext.request.contextPath}/edit/CreateGroup"><button class="button small round success">ADD</button></a>
                        </p>
                    </div>   
                </div>
            </div>
        </div>  
        <%@include file="/footer.jsp" %>
        <!-- Kube JS + jQuery are used for some functionality, but are not required for the basic setup -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/kube.min.js"></script>
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

    </body>
</html>

