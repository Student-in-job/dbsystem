<%-- 
    Document   : PassTest
    Created on : 09.08.2016, 16:40:28
    Author     : ksinn
--%>
<%!String pageTitle = "Exam";%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/header.jspf"%>
<script src="${pageContext.request.contextPath}/resources/js/flipclock.js"></script>         
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flipclock.css">


<div class="fixed text-center" style="width: 120px;">
    <div class="clock" style=" zoom:0.37"></div>   
    <a href="next" class="label outline">next task &rArr;</a>
</div>


<div class="row centered">
    <div class="col text-center">
        <figure>
            <img src="${answer.task.img}">
            <figcaption>Relation schema of database</figcaption>
        </figure>
    </div> 
</div>
<hr>
<div class="row centered" id="1">
    <div class="col text-center" style="color: #f00"> 
        <p><b>${examinator.popMessage()}</b></p>
    </div>
</div>
<hr>
<div class="row centered">
    <div class="col col-3"> 
        <b><i>Составти SQL запрос:</i></b>
    </div>
    <div class="col col-6 text-center"> 
        <b>${answer.task.question}</b>
    </div>
    <div class="col col-3 text-right"> 
        <i>${answer.task.ball} point</i>
    </div>
</div>
<div class="row centered">
    <div class="col col-6">        
        <form class="form" id="checkAnswer" method="POST" action="">    
            <div class="form-item">
                <textarea rows="6" required  name="answer">${answer.query}</textarea>
            </div>
            <div class="form-item text-center">
                <input id="submit" type="submit" class="small button round outline primary" value="Run">
            </div>
        </form>
    </div>
</div>

<hr>

<div class="row centered">
    <div class="col col-1 pull-left">
        <b><i>Result:</i></b>
    </div>
    <div class="col col-11"> 
        <c:if test="${checkedAnswer!=null}">
            <c:if test="${checkedAnswer.hasException()}">
                <b style="color: #f00">${checkedAnswer.exception.message}</b>
            </c:if>
            <c:if test="${checkedAnswer.hasResultArray()}">
                <table class="bordered striped">
                    <c:forEach var="row" items="${checkedAnswer.resultArray}">
                        <tr>
                            <c:forEach var="cell" items="${row}">
                                <td>${cell}</td>
                            </c:forEach>
                        </tr> 
                    </c:forEach>    
                </table>
            </c:if>
        </c:if>
    </div>
</div>   
<div id="my-modal" class="modal-box hide">
    <div class="modal">
        <span class="close"></span>
        <div class="modal-header">Woops</div>
        <div class="modal-body text-center">
            <p>Time expired</p>
            <p><a href="next" class="button outline">next task &rArr;</a></p>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {

        clock = $('.clock').FlipClock(${examinator.leftTime()/1000}, {
            clockFace: 'MinuteCounter',
            autoStart: true,
            language: 'us-us',
            countdown: true,
            callbacks: {
                stop: function () {
                $.modalwindow({target: '#my-modal', width: '300px'});
                
            }
            }
            
        });


    });
</script> 

<%@include file="/footer.jspf"%>



