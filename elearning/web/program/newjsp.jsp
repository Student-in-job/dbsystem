<%-- 
    Document   : newjsp
    Created on : 24.08.2016, 17:53:30
    Author     : ksinn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Material</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="../css/normalize.css">
        <link rel="stylesheet" href="../css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="../css/kube.min.css">

        <link rel="stylesheet" href="../css/kube-ext.css">
        <link rel="stylesheet" href="../css/master.css">

    </head>
    <body>
        <%@include file="../header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" action="CreateArea.jsp" method="post" class="form" enctype="multipart/form-data">
                    <h3 class="text-centered">Material</h3>

                    <div class="form-item">
                        <label>Name</label>
                        <input class="width-100" name="name" value="<%=name!=null?name:""%>" type="text" required>
                    </div>
                    
                    <div class="form-item">
                        <label>Day</label>
                        <input class="width-100" name="day" min="1" name="day" value="<%=day!=null?day:""%>" type="text"  required>
                    </div>
                    
                    <div class="form-item">
                    <label>Inventory</label>
                    <textarea rows="6" required name="inventory"><%=inventory!=null?inventory:""%></textarea>
                    </div>
                    
                    <div class="form-item">
                    <label>Inventory</label>
                    <textarea rows="6" required name="text" id="input"><%=text!=null?text:""%></textarea>
                    </div>
                    
                    <div class="form-item">
                        <button class="button primary width-100 big">Complete Sign Up</button>
                    </div>
                </form>
            </div>
        </div>
        <script type="text/javascript" src="<%=request.getServletContext().getContextPath()%>/js/jquery.validate.min.js"></script> 
        <script>
            $(document).ready(function(){

                $("#form").validate({

                   rules:{ 

                        name:{
                            required: true,
                            minlength: 6,
                            maxlength: 100,
                        },
                        
                        day:{
                            required: true,
                            number: true,
                            min: 1
                        },
                        
                        inventory:{
                            required: true,
                            minlength: 20,
                            maxlength: 200,
                        },
                        
                        text:{
                            required: true,
                            minlength: 20,
                        }
                        
                   }

                });


            }); //end of ready
        </script> 
        <%@include file="../footer.jsp" %>
    </body>
</html>
