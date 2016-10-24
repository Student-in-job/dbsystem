<%-- 
    Document   : Test
    Created on : 13.07.2016, 16:56:55
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task</title>
        <link href="../img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
    </head>
    <body>
<%@include file="/header.jsp" %>

        <div class=" test">
            <div class="row ">
                <div class="col col-3 offset-1">
                    <h4><a href="Group?group=${task.group.id}">${task.group.name}</a></h4>
                    <h4>Time: ${task.time}</h4>
                    <h4>Ball: ${task.ball}</h4>
                </div>
                <div class="col col-1">
                    <a class="test-edit" href="${pageContext.request.contextPath}/edit/EditTask?task=${task.id}">
                        <i class="fa fa-cog font-green" aria-hidden="true"></i>
                        Edit
                    </a>
                </div>
            </div>
            <hr>            

            <div class="col">
                <p>${task.question}</p>
                <b>${task.answer}</b>
<%--                <table>
<%
    try{
        ResultSet rs = task.getAnswerResult();

%>
                    <tr>
<%        for(int i=1; i<=rs.getMetaData().getColumnCount(); i++){%>
                        <th><%=rs.getMetaData().getColumnName(i)%></th>
<%}%>
                    </tr>
<%
    while(rs.next()){%>
                    <tr>
<%        for(int i=1; i<=rs.getMetaData().getColumnCount(); i++){%>
                        <td><%=rs.getString(i)%></td>
<%}%>
                    </tr>
<%}%>                
                </table>
--%>               
            </div>

        </div>
<%@include file="/footer.jsp" %>
    </body>
</html>