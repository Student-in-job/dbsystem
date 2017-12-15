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

<div class="row centered">
    <div class="col col-8 text-center">
        <figure>
            <img src="${answer.task.img}">
            <figcaption>Relation schema of database</figcaption>
        </figure>
    </div> 
    <div class="col col-4 text-center">
        <div class="row">
            <div class="col text-right">
                <div class="clock" style=" zoom:1"></div>   
                <a href="next" class="label outline">next task &rArr;</a> 
            </div>
        </div>
        <div class="row centered">
            <div class='col'>
                <div class="row">
                    <div class="col col-4"> 
                        <i>Составти SQL запрос:</i>
                    </div>
                    <div class="col col-4 text-center"> 
                        <b>${examinator.solvedProblems}/${examinator.work.count}</b>
                    </div>
                    <div class="col offset-1 col-3 text-right"> 
                        <i>${answer.task.ball} point</i>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col text-center" style="color: #f00"> 
                        <p><b>${examinator.popMessage()}</b></p>
                    </div>
                </div>
                <div class="row space-top">
                    <div class="col text-left"> 
                        <p>${answer.task.question}</p>
                    </div>
                </div>
            </div>
        </div>       
        <div class="row centered">
            <div class="col">        
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
    var t = (${examinator.leftTime()}) / 1000;
    if (t < 0)
        t = 0;
    clock = $('.clock').FlipClock(t, {
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
</script> 

<%@include file="/footer.jspf"%>



