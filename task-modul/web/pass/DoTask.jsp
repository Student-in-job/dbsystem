<%-- 
    Document   : PassTest
    Created on : 09.08.2016, 16:40:28
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/Error.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/img/favicon.png" rel="shortcut icon" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/kube-ext.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/master.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flipclock.css">
         
    </head>
    <body>
        <%@include file="/header.jsp" %>

        <div class="test space-top">
            <div class="row centered">
                <div class="col col-4">
                    <%--<p>time-left: <span id="timer"></span></p>--%>
                    <div class="clock"></div>
                        <div id="message" style="color: red; font-size: 150%; padding: 20px;">
                             ${error}
                        </div>

                </div>
                <div class="col col-2 space-top">
                    <a href="Check" class="button big error round">Finish task</a>
                </div>
            </div> 
                        
                <div class="row centered">
                    <div class="col coll-11">    
                            <p>${task.question}</p>
                            <img src="${task.img}">
                    </div>
                </div>
                    <div class="row">
                        <div class="col col-5">        
                            <form id="checkAnswer" method="POST" action="Check">    
                                <textarea rows="6" required  name="answer">${answer}</textarea>

                                <div class="col space-top">
                                    <input id="submit" type="submit" class="button round outline primary" value="Confirm &rArr;">
                                </div>
                            </form>
                        </div>
                        <div class="col col-7">        
                            <table class="bordered">
                                <c:forEach var="row" items="${rs}">
                                 <tr>
                                     <c:forEach var="cell" items="${row}">
                                     <td>${cell}</td>
                                     </c:forEach>
                                 </tr> 
                                 </c:forEach>    
                            </table>
                        </div> 
                    </div>  
            </div>
                            
              
        </div>
        
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/flipclock.js"></script>    
        <script src="${pageContext.request.contextPath}/js/kube.min.js"></script>           
        
        <script> 
       
        function show()  
        {  
            $.ajax({  
                url: "Timer",  
                cache: false, 
                error: function(){
                    window.location.href = "${pageContext.request.contextPath}/Error.jsp";
                },
                success: function(data){
                    if(data<=0){
                        window.location.href = "${pageContext.request.contextPath}/pass/Check";
                    }
                    
                }  
            });  
        } 
        
        
        
                
        $(document).ready(function () {
            setInterval('show()',1000); 
            var clock;
            clock = $('.clock').FlipClock({
                clockFace: 'MinuteCounter',
                autoStart: false,
                language: 'us-us',
            });
            clock.setTime(${task.time}*60-3);
            $.ajax({  
                url: "Timer",  
                cache: false, 
                error: function(){
                    window.location.href = "${pageContext.request.contextPath}/Error.jsp";
                },
                success: function(data){
                   clock.setTime(data/1000-2);  
                }  
            }); 
            
            clock.setCountdown(true);
            clock.start();
            
        });
        
    </script> 
             
        <%@include file="/footer.jsp" %>

    </body>
</html>
