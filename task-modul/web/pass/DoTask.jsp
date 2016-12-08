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
    </head>
    <body>
        <div>
            ${error}
        </div>
        <%@include file="/header.jsp" %>

        <div class="row centered test">
            <div class="col col-11">
                <p>time-left: <span id="timer"></span></p>
                <h4>PASS TEST!</h4>
            </div>
            <div class="col col-11 pagination">
                <a href="Check"><button class="button small round outline">Finish task</button></a>
            </div>
            
            
                <div class="task-table">    
                    <div class="task-table-row">    
                        <div class="task-table-cell">
                            <p>${task.question}</p>
                            <img class="db-schem" src="${task.img}">
                        </div>
                        <div class="task-table-cell">
                            
                        </div>    
                    </div>
                    <div class="task-table-row">        
                        <form class="task-table-cell" method="POST" action="Check">    
                            <div class="col col-11">
                                    <textarea rows="6" required  name="answer">${answer}</textarea>
                            </div>

                            <div class="col col-11">
                                <input id="submit" type="submit" class="button round outline primary" value="Confirm &rArr;">
                            </div>
                        </form>
                        <table class="task-table-cell">
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
                    setTimeout(function(){
                        var elem = $('submit');
                        elem.parentNode.removeChild(elem);
                    }, data);
                    data = Math.floor(data/1000);
                    var h = Math.floor(data/3600);
                    data = Math.floor(data%3600);
                    var m = Math.floor(data/60);
                    var s = Math.floor(data%60);
                    $("#timer").html(h + ':' + m + ':' + s);  
                }  
            });  
        } 
        
        
      
        $(document).ready(function(){  
            show();  
            setInterval('show()',1000);  
        });  
    </script> 
        
        <%@include file="/footer.jsp" %>

    </body>
</html>
