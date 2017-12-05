<%-- 
    Document   : PassTest
    Created on : 09.08.2016, 16:40:28
    Author     : ksinn
--%>
<%!String pageTitle = "Exam";%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/header.jspf"%>

<div class="test space-top">
    <div class="row centered">
        <div class="col col-4">
            <%--<p>time-left: <span id="timer"></span></p>--%>
            <div class="clock"></div>
        </div>
        <div class="col col-2 space-top">
            <a href="next" class="button big error round">Next task</a>
        </div>
    </div> 

    <div class="row centered">
        <div class="col coll-11">    
            <p>${answer.task.question}</p>
            <img src="${answer.task.img}">
        </div>
    </div>
    <div class="row">
        <div class="col col-5">        
            <form id="checkAnswer" method="POST" action="">    
                <textarea rows="6" required  name="answer">${answer.query}</textarea>

                <div class="col space-top">
                    <input id="submit" type="submit" class="button round outline primary" value="Confirm &rArr;">
                </div>
            </form>
        </div>
        <div style="color: #f00">${examinator.popMessage()}</div>
        <div class="col col-7">        
            <c:if test="${checkedAnswer!=null}">
                <c:if test="${checkedAnswer.hasException()}">
                    <b style="color: #f00">${checkedAnswer.exception.message}</b>
                </c:if>
                <c:if test="${checkedAnswer.hasResultArray()}">
                    <table class="bordered">
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
</div>


</div>

<script src="${pageContext.request.contextPath}/resources/js/flipclock.js"></script>         

<script>

    function show()
    {
        $.ajax({
            url: "timer",
            cache: false,
            success: function (data) {
                if (data <= 0) {
                    clearInterval(intervalID);
                    clock.stop();
                }
                clock.setTime(data / 1000);
                clock.setCountdown(true);
                //clock.start();

            }
        });
    }
    var clock;
    var intervalID;
    $(document).ready(function () {

        clock = $('.clock').FlipClock(${examinator.leftTime()/1000}, {
            clockFace: 'MinuteCounter',
            autoStart: true,
            language: 'us-us',
            countdown: true
        })
        //clock.setCountdown(true);
        



    });

</script> <%@include file="/footer.jspf"%>



