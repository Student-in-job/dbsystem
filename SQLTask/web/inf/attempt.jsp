<%-- 
    Document   : attempt
    Created on : 14.12.2017, 12:20:16
    Author     : ksinn
--%>

<%!String pageTitle = "temple";%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:query var="res" dataSource="jdbc/entetyDB">
    select user_id, 
    (select question from task where id=task_id) as question, 
    answer as you_answer, 
    (select answer from task where id=task_id) as right_answer 

    from works join attempt on work_id = works.id
    where user_id>3 and attempt.id in (select id from (select work_id, task_id, max(id) as id from attempt group by work_id, task_id) as A) and flag = 0
    order by user_id, attempt.id
</sql:query>
<%@include file="/header.jspf"%>

<div class="row centered bg-blue">
    <div class="col text-center">
        <table>
            <tr>
                <th>user_id</th>
                <th>question</th>
                <th>you_answer</th>
                <th>right_answer</th>
            </tr> 
            <c:forEach var="row" items="${res.rows}">
                <tr>
                    <td>${row.user_id}</td>
                    <td>${row.question}</td>
                    <td>${row.you_answer}</td>
                    <td>${row.right_answer}</td>
                </tr> 
            </c:forEach>
        </table> 
    </div>
</div>  


<%@include file="/footer.jspf"%>


