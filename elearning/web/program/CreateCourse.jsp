<%-- 
    Document   : CreateCours
    Created on : 02.08.2016, 15:24:36
    Author     : ksinn
--%>

<%@page import="DataBasePak.*"%>
<%@page import="Learning.Material"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Learning.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../logfrag.jsp" %>
<%
    SimpleDateFormat form = new SimpleDateFormat();
    form.applyPattern("yyyy-MM-dd");
        
    int program;
    Program prog;
    try{
        program= Integer.parseInt(request.getParameter("program"));
        prog = new Program(program);
    }catch(NumberFormatException ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=InvalidRequest"); return;}
    catch(ObjectNotFind ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp?e=ObjectNotFind"); return;}
    catch(Exception ex){Log.getOut(ex.getMessage()); response.sendRedirect(request.getServletContext().getContextPath()+"/Error.jsp"); return;}
     
        
        if(!(prog.isPublished()/*&&user.getActiveCourse(program)==null*/)/*&&prog.getCourse()!=null**/){
            %>
<!DOCTYPE html>
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
            </head>
            <body>
                <p>Вы не можете начать курс по этой программе</p>
            </body>
        </html>

<%
            return;}

        if(request.getMethod().equals("GET")){%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course</title>
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

                <form id="form" action="CreateCourse.jsp" method="post" class="form" enctype="multipart/form-data">
                    <h3 class="text-centered">Course</h3>
                    <input type="hidden" name="program" value="<%=request.getParameter("program")%>">
                    <div class="form-item">
                        <label>Start Date</label>
                        <input class="width-100" name="start" type="date" value="<%=form.format(new Date(new Date().getTime() + 3600*1000*24*8))%>" required>
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

                        start:{
                            required: true,
                            date: true,
                            maxlength: 100,
                        }                        
                   },

                });


            }); //end of ready
        </script>
        <%@include file="../footer.jsp" %>
    </body>
</html>

                <%}
                if(request.getMethod().equals("POST")){

                        Date start = form.parse(request.getParameter("start"));
                        if(start.compareTo(new Date(new Date().getTime() + 3600*1000*24*7))<0) 
                            {%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course</title>
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

                <form id="form" action="CreateCourse.jsp" method="post" class="form">
                    <h3 class="text-centered">Course</h3>
                    <input type="hidden" name="program" value="<%=request.getParameter("program")%>">
                    
                    <div class="alert error">
                        <p style="color: red;">The date so early!</p>
                    </div>
                    
                    <div class="form-item">
                        <label>Start Date</label>
                        <input class="width-100" name="start" type="date" value="<%=form.format(new Date(new Date().getTime() + 3600*1000*24*8))%>" required>
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

                        start:{
                            required: true,
                            date: true,
                            maxlength: 100,
                        }                        
                   },

                });


            }); //end of ready
        </script>
        <%@include file="../footer.jsp" %>
    </body>
</html>
                <% return;}
                        Course course = new Course(start, prog);
                        session.setAttribute("course", course);
                        response.sendRedirect("CreateMaterialSchedule.jsp");
                }

%> 
