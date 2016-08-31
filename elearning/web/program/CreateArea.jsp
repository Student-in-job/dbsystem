<%-- 
    Document   : CreateArea
    Created on : 20.08.2016, 12:42:36
    Author     : ksinn
--%>

<%@page import="java.io.IOException"%>
<%@page import="DataBasePak.*"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../logfrag.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    String name = null;
    
    if(request.getMethod()=="POST"){
        
        name = request.getParameter("name");
        try{    
                Area na = new Area(name);
                na.Write(user, request.getPart("picture"));
                response.sendRedirect(request.getServletContext().getContextPath()+"/Courses.jsp?area_id="+na.getID()); return;

            
        }catch(IllegalAction ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IllegalAction"); return;}
        catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
        catch (IOException ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=IOExtension"); return;} 
        catch (InvalidParameter ex) {Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidParameter"); return;} 
        catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}       
}    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Area</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/normalize.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/font-awesome.min.css">
        <!-- Kube CSS -->
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube.min.css">

        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/kube-ext.css">
        <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/css/master.css">

    </head>
    <body>
        <%@include file="../header.jsp"%>

        <div class="row centered registration">
            <div class="col col-4">

                <form id="form" action="CreateArea.jsp" method="post" class="form" enctype="multipart/form-data">
                    <h3 class="text-centered">Area</h3>

                    <div class="form-item">
                        <label>Name</label>
                        <input class="width-100" name="name" type="text" required>
                    </div>
                    
                    <div class="form-item">
                        Your photo:
                        <input type="file" name="picture" required>
                    </div>

                    <div class="form-item">
                        <button class="button primary width-100 big">Complete</button>
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
                            minlength: 1,
                            maxlength: 15,
                        },
                        
                        picture:{
                            required: true,
                            accept: "png|jpg|jpeg",
                        },
                        
                   },

                });


            }); //end of ready
        </script>
        <%@include file="../footer.jsp" %>
    </body>
</html>