<%-- 
    Document   : index
    Created on : 05.11.2016, 11:37:20
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="post" action="sign" enctype="multipart/form-data">
            <div class="form-item">        
                        <label>Key</label> 
                        <input name="key" type="number" >
                    </div>
                    <div class="form-item">        
                        <label>File</label> 
                        <input name="data" type="file"><br>
                    </div>
                    
                    <div class="form-item">        
                    	<button class="button primary width-100 big">Complete</button>
                    </div> 
        </form>
    </body>
</html>
