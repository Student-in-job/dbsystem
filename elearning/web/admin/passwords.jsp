<%-- 
    Document   : passwords
    Created on : 08.12.2017, 22:30:52
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/header.jsp" %>
<%@include file="/bar.jsp" %>
<div class="row centered bg-blue">
    <div class="col col-8">
        <h4>User's current passwords</h4>
        <h5>next passwords will generate in ${generateTime}</h5>
        <table class='table'>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.key.surname} ${user.key.name}</td>
                    <td>${user.key.mail}</td>
                    <td>${user.value}</td>
                    <td> <button onclick="genKey(${user.key.id})">gen new key</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<div id="my-modal" class="modal-box hide">
    <div class="modal">
        <span class="close"></span>
        <div class="modal-header"></div>
        <div id="modalBody" class="modal-body text-center">

        </div>
    </div>
</div>
<script>
    function genKey(id) {

        $.ajax("generateKey?id=" + id, {
            method: 'get',
            success: function (result) {
                console.log(123);
                document.getElementById("modalBody").innerHTML = result;
                $.modalwindow({target: '#my-modal', width: '300px', header: 'Response'});
            }
        });

    }
</script>
<%@include file="/footer.jsp" %>


