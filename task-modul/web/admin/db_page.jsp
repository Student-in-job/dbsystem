<%-- 
    Document   : db_page
    Created on : 18.12.2016, 19:43:25
    Author     : ksinn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.db_page"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/Error.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
if(request.getMethod().equals("POST")){
    db_page db = new db_page();
    ArrayList rs = db.Execute(request.getParameter("sql"));
    pageContext.setAttribute("rs", rs);
}    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
        <form action="" method="POST">
            <p><textarea name="sql"><%=request.getParameter("sql")%></textarea></p>
            <p><input type="submit"></p>
        </form>
        </div>
        <div>
            <table>
        <c:forEach var="row" items="${rs}">
            <tr>
            <c:forEach var="cell" items="${row}">
                <td>${cell}</td>
            </c:forEach>
            </tr> 
        </c:forEach>
            </table>
        </div>
    </body>
</html>
