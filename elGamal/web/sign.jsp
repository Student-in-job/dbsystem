<%-- 
    Document   : sign
    Created on : 04.12.2016, 14:34:16
    Author     : ksinn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="">
                    
                    <div class="form-item">        
                        <label>Message: </label> 
                        <textarea name="message">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</textarea>
                    </div>
            
                    <div class="form-item">        
                        <label>p: </label> 
                        <input name="p" value="${keys.pk.p}" >
                    </div>
                    <div class="form-item">        
                        <label>g: </label> 
                        <input name="g" value="${keys.pk.g}" >
                    </div>
                    <div class="form-item">        
                        <label>h: </label> 
                        <input name="h" value="${keys.pk.h}" >
                    </div>
                    <c:if test="${check}">                    
                    <div class="form-item">        
                        <label>sign: </label> 
                        <textarea name="sign"></textarea>
                    </div>
                    </c:if>
                    
                    <div class="form-item">        
                    	<input type="submit" >
                    </div> 
        </form>
    </body>
</html>
