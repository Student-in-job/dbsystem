<%-- 
    Document   : CreateTask
    Created on : 05.09.2016, 11:17:11
    Author     : ksinn
--%>
<%!String pageTitle = "List settings";%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/header.jspf"%>

<div class="row centered registration">
    <div class="col col-4">

        <form id="form" class="form" action="" method="POST">
            <h3 class="text-centered">List settings</h3>
            <input type="hidden" name="id" value="${list.id}">

            <div class="form-item">
                <label>Name:</label>
                <input class="width-100" type="text" id="input" required name="name" value="${list.name}">
            </div>

            <div class="form-item">
                <label>Schema:</label>
                <input class="width-100" type="text" id="input" required name="schema" value="${list.schema}">
            </div>

            <div class="form-item">
                <input type="checkbox" name="public">public
            </div>

            <div class="form-item">
                <button class="button primary width-100 big">Complete</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script> 
<script>
    $(document).ready(function () {

        $("#form").validate({
            rules: {
                name: {
                    minlength: 1,
                    maxlength: 32
                }

            }

        });


    }); //end of ready
</script> 


<%@include file="/footer.jspf"%>



